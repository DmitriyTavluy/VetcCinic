package com.example.vetclinica.service;

import com.example.vetclinica.domain.Role;
import com.example.vetclinica.repos.UserRepos;
import com.example.vetclinica.domain.User;

import freemarker.template.utility.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.*;
import java.util.stream.Collectors;

import static java.util.UUID.randomUUID;

@Service
public class UserService implements UserDetailsService {

    @Autowired
    private MailSender mailSender;

    @Autowired
    private UserRepos userRepos;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepos.findByUsername(username);
    }

    public boolean addUser(User user){
        User userFromDb = userRepos.findByUsername(user.getUsername());

        if (userFromDb != null){
            return false;
        }

        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        user.setActivationCode(randomUUID().toString());

        userRepos.save(user);

        if (!StringUtils.isEmpty(user.getEmail())){
            String message = String.format(

                    "ЗДАРОВА, %s! \n" +
                            "Потвердите свою почту : http;//localhost:8080/activate/%s",
            user.getUsername(),
            user.getActivationCode());
            mailSender.send(user.getEmail(),"Activation code",message);

        }
        return true;
    }

    public List<User> findAll() {
        return userRepos.findAll();
    }

    public boolean activateUser(String code) {
       User user =  userRepos.findByActivationCode(code);
        if (user == null){
            return false;
        }
        user.setActivationCode(null);
        userRepos.save(user);

        return true;
    }
}

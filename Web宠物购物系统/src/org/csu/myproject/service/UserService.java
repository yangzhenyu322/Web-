package org.csu.myproject.service;

import org.csu.myproject.domain.Account;
import org.csu.myproject.domain.Log;
import org.csu.myproject.domain.Profile;

public interface UserService {
    Account login(String username, String password);

    int register(Account account);

    boolean usernameExist(String username);

    Profile getProfileById(String id);

    int editAccount(Account account, Profile profile);

    Log getLogById(String userId);

    public String getMsg();
}

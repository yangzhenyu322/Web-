package org.csu.myproject.persistence;

import org.csu.myproject.domain.Account;
import org.csu.myproject.domain.Log;
import org.csu.myproject.domain.Profile;

public interface UserDAO {
    Account findUserByUsernameAndPassword(String username, String password);

    int addUser(Account account);

    boolean getUserByUsername(String username);

    Profile findProfileById(String id);

    //修改用户资料
    int editUser(Account account, Profile profile);

    //查看日志
    Log findLogsByUserId(String userId);
}

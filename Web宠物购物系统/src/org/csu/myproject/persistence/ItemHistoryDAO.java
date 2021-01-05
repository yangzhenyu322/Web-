package org.csu.myproject.persistence;

import org.csu.myproject.domain.ItemHistory;

import java.util.List;

public interface ItemHistoryDAO {

    void UpdateItemHistory(String userId, ItemHistory itemHistory);

    List<ItemHistory>getItemHistoryListByUserId(String userId);
}

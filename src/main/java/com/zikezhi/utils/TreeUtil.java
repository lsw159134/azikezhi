package com.zikezhi.utils;

import java.util.ArrayList;
import java.util.List;

import com.zikezhi.entity.Comments;

/**
 * @author ponder
 * @version 1.0
 * @Date 2016年11月29日
 * @Description: 从表中按uid得到所有的评论内容，再对评论内容进行排序
 * @ClassName TreeUtil.java
 * \
 * \-1
 * \--1.1
 * \---1.1.1
 * \--1.2
 * \-2
 * \--2.1
 * \
 */

public class TreeUtil {

    List<Comments> list2 = new ArrayList<Comments>();

    public List<Comments> recursiveTree(List<Comments> list) {
        if (list == null || list.size() == 0) {
            return list;
        }
        for (int j = 0; j < list.size(); ) {
            //j 不能++是因为list都被 remove掉了，如果再++，那么++之前的数据找不到了
            Comments child = list.get(j);
            String cid = child.getCommentsid().toString();
            list.remove(child);
            list2.add(child);
            for (int i = 0; i < list.size(); i++) {
                if (cid.equals(list.get(i).getParentuid())) {
                    cid = list.get(i).getCommentsid().toString();
                    list2.add(list.get(i));
                    list.remove(list.get(i));
                    list = fo(cid, list);
                }
            }
        }
        recursiveTree(list);
        return list2;
    }

    //子结点
    public List<Comments> fo(String cid, List<Comments> list) {
//		System.out.println(list2);
        if (list == null || list.size() == 0) {
            return list;
        }
        for (int j = 0; j < list.size(); j++) {
            if (cid.equals(list.get(j).getParentuid())) {
                cid = list.get(j).getCommentsid().toString();
                list2.add(list.get(j));
                list.remove(list.get(j));
                list = fo(cid, list);
            }
        }
        return list;
    }

}




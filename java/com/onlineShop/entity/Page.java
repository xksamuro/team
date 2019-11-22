package com.onlineShop.entity;

import java.util.List;

/**
 * @author Hireek
 * @PackName:com.dragon.pojo
 * @ClassName:Page
 * @Description:
 * @date 2019/10/3 0003 上午 7:31
 */
public class Page<T> {
    private int pageNo;
    private List list;
    private int pageSize;
    private int totalItemNumber;

    public Page() {
        super();
    }
    public Page(int pageNo, int pageSize) {
        super();
        this.pageNo = pageNo;
        this.pageSize = pageSize;
    }

    public int getPageNo() {
        if(pageNo < 1){
            pageNo = 1;
        }else if(pageNo > getTotalPageNumber()){
            pageNo = getTotalPageNumber();
        }
        return pageNo;
    }

    public List getList() {
        return list;
    }

    public int getPageSize() {
        return pageSize;
    }

    public long getTotalItemNumber() {
        return totalItemNumber;
    }

    public void setTotalItemNumber(int totalItemNumber) {
        this.totalItemNumber = totalItemNumber;
    }

    public int getTotalPageNumber() {
        int totalPageNumber = totalItemNumber/pageSize;
        if(totalPageNumber%pageSize != 0){
            totalPageNumber++;
        }
        return totalPageNumber;
    }

    public boolean isHasNext() {
        if(getPageNo() < getTotalPageNumber()){
            return true;
        }
        return false;
    }

    public boolean isHasPrev() {
        if (getPageNo() > 1){
            return true;
        }
        return false;
    }

    public int getPrePage() {
        if (isHasPrev()) {
            return getPageNo()-1;
        }
        return getPageNo();
    }

    public void setList(List list) {
        this.list = list;
    }

    public int getNextPage() {
        if (isHasNext()){
            return getPageNo()+1;

        }
        return getPageNo();
    }
}
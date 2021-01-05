package org.csu.myproject.domain;

public class Profile {
    private String id;
    private String langpref;
    private String favcategory;
    private boolean mylistopt;
    private boolean banneropt;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLangpref() {
        return langpref;
    }

    public void setLangpref(String langpref) {
        this.langpref = langpref;
    }

    public String getFavcategory() {
        return favcategory;
    }

    public void setFavcategory(String favcategory) {
        this.favcategory = favcategory;
    }

    public boolean isMylistopt() {
        return mylistopt;
    }

    public void setMylistopt(boolean mylistopt) {
        this.mylistopt = mylistopt;
    }

    public boolean isBanneropt() {
        return banneropt;
    }

    public void setBanneropt(boolean banneropt) {
        this.banneropt = banneropt;
    }
}

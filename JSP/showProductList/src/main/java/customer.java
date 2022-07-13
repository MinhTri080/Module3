public class customer {
    private String name;
    private String birth;
    private String address;
    private String image;

    public customer() {
    }

    public customer(String name, String birth, String address, String image) {
        this.name = name;
        this.birth = birth;
        this.address = address;
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public String getBirth() {
        return birth;
    }

    public String getAddress() {
        return address;
    }

    public String getImage() {
        return image;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return
                name + '\'' +
                        birth + '\'' +
                        address + '\'' +
                        image + '\'';
    }
}

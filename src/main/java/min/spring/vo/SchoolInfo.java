package min.spring.vo;

public class SchoolInfo {
    private String schoolCode;

    private String schoolName;

    private String schoolAddress;

    public String getSchoolCode() {
        return schoolCode;
    }

    @Override
	public String toString() {
		return "SchoolInfo [schoolCode=" + schoolCode + ", schoolName=" + schoolName + ", schoolAddress="
				+ schoolAddress + "]";
	}

	public void setSchoolCode(String schoolCode) {
        this.schoolCode = schoolCode == null ? null : schoolCode.trim();
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName == null ? null : schoolName.trim();
    }

    public String getSchoolAddress() {
        return schoolAddress;
    }

    public void setSchoolAddress(String schoolAddress) {
        this.schoolAddress = schoolAddress == null ? null : schoolAddress.trim();
    }
}
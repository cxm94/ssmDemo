package min.spring.vo;

public class TeacherInfo {
    private String teacherCode;

    private String teacherName;

    @Override
	public String toString() {
		return "TeacherInfo [teacherCode=" + teacherCode + ", teacherName=" + teacherName + ", teacherTel=" + teacherTel
				+ ", teacherSchool=" + teacherSchool + ", teacherGrade=" + teacherGrade + ", teacherClass="
				+ teacherClass + "]";
	}

	private String teacherTel;

    private String teacherSchool;

    private Integer teacherGrade;

    private Integer teacherClass;

    public String getTeacherCode() {
        return teacherCode;
    }

    public void setTeacherCode(String teacherCode) {
        this.teacherCode = teacherCode == null ? null : teacherCode.trim();
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName == null ? null : teacherName.trim();
    }

    public String getTeacherTel() {
        return teacherTel;
    }

    public void setTeacherTel(String teacherTel) {
        this.teacherTel = teacherTel == null ? null : teacherTel.trim();
    }

    public String getTeacherSchool() {
        return teacherSchool;
    }

    public void setTeacherSchool(String teacherSchool) {
        this.teacherSchool = teacherSchool == null ? null : teacherSchool.trim();
    }

    public Integer getTeacherGrade() {
        return teacherGrade;
    }

    public void setTeacherGrade(Integer teacherGrade) {
        this.teacherGrade = teacherGrade;
    }

    public Integer getTeacherClass() {
        return teacherClass;
    }

    public void setTeacherClass(Integer teacherClass) {
        this.teacherClass = teacherClass;
    }
}
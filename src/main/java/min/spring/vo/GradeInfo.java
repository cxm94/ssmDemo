package min.spring.vo;

public class GradeInfo {
    private Integer gradeId;

    private String gradeName;

    @Override
	public String toString() {
		return "GradeInfo [gradeId=" + gradeId + ", gradeName=" + gradeName + "]";
	}

	public Integer getGradeId() {
        return gradeId;
    }

    public void setGradeId(Integer gradeId) {
        this.gradeId = gradeId;
    }

    public String getGradeName() {
        return gradeName;
    }

    public void setGradeName(String gradeName) {
        this.gradeName = gradeName == null ? null : gradeName.trim();
    }
}
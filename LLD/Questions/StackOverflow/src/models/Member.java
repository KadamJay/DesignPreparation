import java.util.List;

public class Member {
    private Account account;
    private List<Badge> badges;

    public int getReputation() {
        return account.getReputation();
    }

    public String getEmail() {
        return account.getEmail();
    }

    public boolean createQuestion(Question question) {
        // Placeholder for implementation
        return true;
    }

    public boolean createTag(Tag tag) {
        // Placeholder for implementation
        return true;
    }
}

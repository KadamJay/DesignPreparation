#!/bin/bash

# Create base directory structure
mkdir -p src/enums src/interfaces src/models

# Enums
cat <<EOF > src/enums/QuestionStatus.java
public enum QuestionStatus {
    OPEN,
    CLOSED,
    ON_HOLD,
    DELETED
}
EOF

cat <<EOF > src/enums/QuestionClosingRemark.java
public enum QuestionClosingRemark {
    DUPLICATE,
    OFF_TOPIC,
    TOO_BROAD,
    NOT_CONSTRUCTIVE,
    NOT_A_REAL_QUESTION,
    PRIMARILY_OPINION_BASED
}
EOF

cat <<EOF > src/enums/AccountStatus.java
public enum AccountStatus {
    ACTIVE,
    CLOSED,
    CANCELED,
    BLACKLISTED,
    BLOCKED
}
EOF

# Interface
cat <<EOF > src/interfaces/Search.java
import java.util.List;
public interface Search {
    List<Question> search(String query);
}
EOF

# Models
cat <<EOF > src/models/Account.java
public class Account {
    private String id;
    private String password;
    private AccountStatus status;
    private String name;
    private Address address;
    private String email;
    private String phone;
    private int reputation;

    public boolean resetPassword() {
        // Placeholder for implementation
        return true;
    }
}
EOF

cat <<EOF > src/models/Member.java
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
EOF

cat <<EOF > src/models/Admin.java
public class Admin extends Member {
    public boolean blockMember(Member member) {
        // Placeholder for implementation
        return true;
    }

    public boolean unblockMember(Member member) {
        // Placeholder for implementation
        return true;
    }
}
EOF

cat <<EOF > src/models/Moderator.java
public class Moderator extends Member {
    public boolean closeQuestion(Question question) {
        // Placeholder for implementation
        return true;
    }

    public boolean undeleteQuestion(Question question) {
        // Placeholder for implementation
        return true;
    }
}
EOF

cat <<EOF > src/models/Badge.java
public class Badge {
    private String name;
    private String description;
    // Getters and setters could be added here
}
EOF

cat <<EOF > src/models/Tag.java
public class Tag {
    private String name;
    private String description;
    private long dailyAskedFrequency;
    private long weeklyAskedFrequency;
    // Getters and setters could be added here
}
EOF

cat <<EOF > src/models/Notification.java
import java.util.Date;

public class Notification {
    private int notificationId;
    private Date createdOn;
    private String content;

    public boolean sendNotification() {
        // Placeholder for implementation
        return true;
    }
}
EOF

cat <<EOF > src/models/Question.java
import java.util.Date;
import java.util.List;

public class Question implements Search {
    private String title;
    private String description;
    private int viewCount;
    private int voteCount;
    private Date creationTime;
    private Date updateTime;
    private QuestionStatus status;
    private QuestionClosingRemark closingRemark;

    private Member askingMember;
    private Bounty bounty;
    private List<Photo> photos;
    private List<Comment> comments;
    private List<Answer> answers;

    public boolean close() {
        // Placeholder for implementation
        return true;
    }

    public boolean undelete() {
        // Placeholder for implementation
        return true;
    }

    public boolean addComment(Comment comment) {
        // Placeholder for implementation
        return true;
    }

    public boolean addBounty(Bounty bounty) {
        // Placeholder for implementation
        return true;
    }

    @Override
    public List<Question> search(String query) {
        // Placeholder for search implementation
        return null;
    }
}
EOF

cat <<EOF > src/models/Comment.java
import java.util.Date;

public class Comment {
    private String text;
    private Date creationTime;
    private int flagCount;
    private int voteCount;

    private Member askingMember;

    public boolean incrementVoteCount() {
        // Placeholder for implementation
        return true;
    }
}
EOF

cat <<EOF > src/models/Answer.java
import java.util.Date;
import java.util.List;

public class Answer {
    private String answerText;
    private boolean accepted;
    private int voteCount;
    private int flagCount;
    private Date creationTime;

    private Member creatingMember;
    private List<Photo> photos;

    public boolean incrementVoteCount() {
        // Placeholder for implementation
        return true;
    }
}
EOF    
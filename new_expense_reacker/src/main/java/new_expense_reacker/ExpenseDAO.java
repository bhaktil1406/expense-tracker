package new_expense_reacker;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ExpenseDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/expense_tracker";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "";

    private Connection connection;

    // Inner Expense class
    public static class Expense {
        private int id; // Add ID field
        private double amount;
        private String description;
        private String date;
        private String username;

        // Constructor with ID parameter
        public Expense(int id, double amount, String description, String date, String username) {
            this.id = id;
            this.amount = amount;
            this.description = description;
            this.date = date;
            this.username = username;
        }

     // Getters and setters
        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }
        public double getAmount() {
            return amount;
        }

        public void setAmount(double amount) {
            this.amount = amount;
        }

        public String getDescription() {
            return description;
        }

        public void setDescription(String description) {
            this.description = description;
        }

        public String getDate() {
            return date;
        }

        public void setDate(String date) {
            this.date = date;
        }

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }
    }


    public ExpenseDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Failed to establish a database connection.");
            // Handle connection initialization failure
        }
    }

    public boolean addExpense(Expense expense) {
        try {
            String query = "INSERT INTO expenses (id, amount, description, date, username) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, expense.getId());
            statement.setDouble(2, expense.getAmount());
            statement.setString(3, expense.getDescription());
            statement.setString(4, expense.getDate());
            statement.setString(5, expense.getUsername());
            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Expense> getExpensesByUsername(String username) {
        List<Expense> expenses = new ArrayList<>();
        try {
            String query = "SELECT * FROM expenses WHERE username = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
            	 int id = resultSet.getInt("id");
                double amount = resultSet.getDouble("amount");
                String description = resultSet.getString("description");
                String date = resultSet.getString("date");
                Expense expense = new Expense(id, amount, description, date, username);
                expenses.add(expense);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return expenses;
    }
    
    public List<Expense> getExpensesByUsernameAndDate(String username, String date) {
        List<Expense> expenses = new ArrayList<>();
        try {
            String query;
            PreparedStatement statement;

            if (date != null && !date.isEmpty()) {
                // If date is provided, fetch expenses for the specified username and date
                query = "SELECT * FROM expenses WHERE username = ? AND date = ?";
                statement = connection.prepareStatement(query);
                statement.setString(1, username);
                statement.setString(2, date);
            } else {
                // If date is not provided, fetch all expenses for the specified username
                query = "SELECT * FROM expenses WHERE username = ?";
                statement = connection.prepareStatement(query);
                statement.setString(1, username);
            }

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                double amount = resultSet.getDouble("amount");
                String description = resultSet.getString("description");
                String expenseDate = resultSet.getString("date");
                Expense expense = new Expense(id, amount, description, expenseDate, username);
                expenses.add(expense);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return expenses;
    }

    public boolean deleteExpense(int expenseId) {
        try {
            String query = "DELETE FROM expenses WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, expenseId);
            int rowsDeleted = statement.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public boolean updateExpense(Expense expense) {
        try {
            String query = "UPDATE expenses SET amount = ?, description = ?, date = ? WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setDouble(1, expense.getAmount());
            statement.setString(2, expense.getDescription());
            statement.setString(3, expense.getDate());
            statement.setInt(4, expense.getId());
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}


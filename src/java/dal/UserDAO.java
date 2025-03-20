/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import context.DBContext;
import model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Role;

/**
 *
 * @author Admin
 */
public class UserDAO extends DBContext {

    public boolean isDuplicatedEmail(String email) {
        String sql = """
                     SELECT 1
                       FROM [dbo].[Users]
                       WHERE Email = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    //lay het du lieu trong bang roke
    public List<Role> getAllRole() {
        List<Role> list = new ArrayList<>();
        String sql = """
                     SELECT [role_id]
                     ,[role_name]
                     FROM [dbo].[Role]"""; //thuc thi cau truy van
        try {
            PreparedStatement pre = connection.prepareStatement(sql);//goi cau truy van
            ResultSet rs = pre.executeQuery();//thuc thi cau truy van
            while (rs.next()) {
                list.add(new Role(rs.getInt(1),
                        rs.getString(2))); //add du lieu vao list
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Role getRole(int roleID) {
        String sql = """
                     SELECT [role_id]
                           ,[role_name]
                       FROM [dbo].[Role]
                       WHERE [role_id] = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roleID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Role role = new Role(rs.getInt("role_id"), rs.getString("role_name"));
                return role;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public User getUser(String email, String password) {
        String sql = """
                     SELECT [UserID]
                           ,[role_id]
                           ,[Name]
                           ,[Email]
                           ,[Password]
                           ,[Phone]
                       FROM [dbo].[Users]
                       WHERE [Email] = ? and [Password] = ? """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                // Extracting values from the ResultSet
                int uid = rs.getInt("UserID");
                int roleId = rs.getInt("role_id");
                Role role = getRole(roleId);
                String Name = rs.getString("Name");
                String phone = rs.getString("Phone");

                User user = new User(uid, role, Name, email, password, phone);
                return user;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    //account
    public Account getAccountByUId(String uid) {
        String sql = """
                     SELECT [UserID]
                           ,[role_id]
                           ,[Name]
                           ,[Email]
                           ,[Password]
                           ,[Phone]
                           ,[Gender]
                           ,[Address]
                           ,[image_url]
                       FROM [dbo].[Users]
                       where UserID = ?"""; //thuc thi cau truy van
        try {
            PreparedStatement pre = connection.prepareStatement(sql);//goi cau truy van
            pre.setString(1, uid);//set id vao dau ? thu nhat
            ResultSet rs = pre.executeQuery();//thuc thi cau truy van 
            while (rs.next()) {
                return new Account(
                        rs.getInt(1), // UserID
                        rs.getInt(2), // role_id
                        rs.getString(3), // Name
                        rs.getString(4), // Email
                        rs.getString(5), // Password
                        rs.getString(6), // Phone
                        rs.getString(7), // Gender
                        rs.getString(8), // Address
                        rs.getString(9) // image_url
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Account> getAccountByRole(int role) {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT * FROM Users WHERE role_id = ?"; //thuc thi cau truy van
        try {
            PreparedStatement pre = connection.prepareStatement(sql);//goi cau truy van
            pre.setInt(1, role);//set id vao dau ? thu nhat
            ResultSet rs = pre.executeQuery();//thuc thi cau truy van 
            while (rs.next()) {
//                list.add(new Account(
//                        rs.getInt("userId"),
//                        rs.getInt("roleId"),
//                        rs.getString("name"),
//                        rs.getString("email"),
//                        rs.getString("password"),
//                        rs.getString("phone"),
//                        rs.getString("gender"),
//                        rs.getString("address"),
//                        rs.getString("image_url")
//                ));
                int userId = rs.getInt(1);
                int roleId = rs.getInt(2);
                String name = rs.getString(3);
                String email = rs.getString(4);
                String password = rs.getString(5);
                String phone = rs.getString(6);
                String gender = rs.getString(7);
                String address = rs.getString(8);
                String image = rs.getString(9);

                list.add(new Account(userId, roleId, name, email, password, phone, gender, address, image));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Account> getALLAccount() {
        List<Account> list = new ArrayList<>();
        String sql = """
                     SELECT *
                       FROM [dbo].[Users]""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);//goi cau truy van
            ResultSet rs = pre.executeQuery();//thuc thi cau truy van
            while (rs.next()) {
//                list.add(new Account(rs.getInt(1),
//                        rs.getInt(2),
//                        rs.getString(3),
//                        rs.getString(4),
//                        rs.getString(5),
//                        rs.getString(6),
//                        rs.getString(7),
//                        rs.getString(8),
//                        rs.getString(9)));
                int userId = rs.getInt(1);
                int roleId = rs.getInt(2);
                String name = rs.getString(3);
                String email = rs.getString(4);
                String password = rs.getString(5);
                String phone = rs.getString(6);
                String gender = rs.getString(7);
                String address = rs.getString(8);
                String image = rs.getString(9);

                list.add(new Account(userId, roleId, name, email, password, phone, gender, address, image));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    //delete account
    public void deleteAccount(String uid) {
        String sql = """
                     DELETE FROM [dbo].[Users]
                           WHERE UserID = ?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);//goi cau truy van
            pre.setString(1, uid);//set cid vao dau ? thu nhat
            ResultSet rs = pre.executeQuery();//thuc thi cau truy van 
            pre.executeUpdate();//do cau lenh nay k tra ve bang result nen khong can rs.get gi ca
        } catch (SQLException e) {
        }
    }

    //insert account
    public void insertAccount(String role, String name, String email, String pass, String phone, String gender, String address, String image) {
        String sql = """
                     INSERT INTO [dbo].[Users]
                                ([role_id]
                                ,[Name]
                                ,[Email]
                                ,[Password]
                                ,[Phone]
                                ,[Gender]
                                ,[Address]
                                ,[image_url])
                          VALUES (?, ?, ?, ?, ?,?,?,?)""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);//goi cau truy van
            pre.setString(1, role);//set cid vao dau ? thu nhat
            pre.setString(2, name);//set cid vao dau ? thu nhat
            pre.setString(3, email);//set cid vao dau ? thu nhat
            pre.setString(4, pass);//set cid vao dau ? thu nhat
            pre.setString(5, phone);//set cid vao dau ? thu nhat
            pre.setString(6, gender);//set cid vao dau ? thu nhat
            pre.setString(7, address);//set cid vao dau ? thu nhat
            pre.setString(8, image);//set cid vao dau ? thu nhat
            ResultSet rs = pre.executeQuery();//thuc thi cau truy van 
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    //edit account
    public void editAccount(String role, String name, String email, String pass, String phone, String gender, String address, String image,
            String uid) {
        String sql = """
                     UPDATE [dbo].[Users]
                        SET [role_id] = ?
                           ,[Name] = ?
                           ,[Email] = ?
                           ,[Password] = ?
                           ,[Phone] = ?
                           ,[Gender] = ?
                           ,[Address] = ?
                           ,[image_url] = ?
                      WHERE  UserID = ?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);//goi cau truy van

            pre.setString(1, role);//set cid vao dau ? thu nhat
            pre.setString(2, name);//set cid vao dau ? thu nhat
            pre.setString(3, email);//set cid vao dau ? thu nhat
            pre.setString(4, pass);//set cid vao dau ? thu nhat
            pre.setString(5, phone);//set cid vao dau ? thu nhat
            pre.setString(6, gender);//set cid vao dau ? thu nhat
            pre.setString(7, address);//set cid vao dau ? thu nhat
            pre.setString(8, image);//set cid vao dau ? thu nhat
            pre.setString(9, uid);//set cid vao dau ? thu nhat
            ResultSet rs = pre.executeQuery();//thuc thi cau truy van 
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        List<Account> accounts = dao.getALLAccount();
        List<Account> a = dao.getAccountByRole(4);
        if (accounts.isEmpty()) {
            System.out.println("Danh sách tài khoản rỗng!");
        } else {
            System.out.println("get account by role " + a);
        }
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Payment {
     private int paymentId;
    private int studentId;
    private int tutorId;
    private int courseId;
    private double amount;
    private String method;
    private String date;
    private String status;

    public Payment() {
    }

    public Payment(int paymentId, int studentId, int tutorId, int courseId, double amount, String method, String date, String status) {
        this.paymentId = paymentId;
        this.studentId = studentId;
        this.tutorId = tutorId;
        this.courseId = courseId;
        this.amount = amount;
        this.method = method;
        this.date = date;
        this.status = status;
    }

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public int getTutorId() {
        return tutorId;
    }

    public void setTutorId(int tutorId) {
        this.tutorId = tutorId;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Payment{" + "paymentId=" + paymentId + ", studentId=" + studentId + ", tutorId=" + tutorId + ", courseId=" + courseId + ", amount=" + amount + ", method=" + method + ", date=" + date + ", status=" + status + '}';
    }
    
    
}

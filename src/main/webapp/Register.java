package webapp;

import java.sql.PreparedStatement;
import java.sql.Statement;
import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JToolBar;
import java.awt.Color;
import java.awt.Font;
import javax.swing.ImageIcon;
import javax.swing.JTextField;
import javax.swing.UIManager;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.SwingConstants;
import javax.swing.border.BevelBorder;
import java.awt.Cursor;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

public class Register extends JFrame {

	private JPanel contentPane;
	private JTextField email;
	private JTextField lastname;
	private JTextField firstname;
	private JTextField password;
	private JTextField phonenumber;
	protected JLabel passwordField;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Register frame = new Register();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public Register() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(300, 100, 850, 480);
		contentPane = new JPanel();
		contentPane.setBackground(new Color(255, 153, 153));
		contentPane.setBorder(new EmptyBorder(100, 100, 100, 100));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel title = new JLabel("Register an account");
		title.setForeground(new Color(255, 255, 255));
		title.setFont(new Font("Rage Italic", Font.PLAIN, 42));
		title.setBackground(new Color(255, 255, 255));
		title.setBounds(253, 40, 392, 47);
		contentPane.add(title);
		
		JLabel car = new JLabel("");
		car.setIcon(new ImageIcon(Register.class.getResource("/webapp/images/car.png")));
		car.setBounds(10, 48, 133, 138);
		contentPane.add(car);
		
		email = new JTextField();
		email.setBorder(UIManager.getBorder("InternalFrame.border"));
		email.setBounds(253, 241, 310, 30);
		contentPane.add(email);
		email.setColumns(10);
		
		lastname = new JTextField();
		lastname.setBorder(UIManager.getBorder("InternalFrame.border"));
		lastname.setColumns(10);
		lastname.setBounds(253, 186, 310, 30);
		contentPane.add(lastname);
		
		firstname = new JTextField();
		firstname.setBorder(UIManager.getBorder("InternalFrame.border"));
		firstname.setColumns(10);
		firstname.setBounds(253, 130, 310, 30);
		contentPane.add(firstname);
		
		password = new JTextField();
		password.setBorder(UIManager.getBorder("InternalFrame.border"));
		password.setColumns(10);
		password.setBounds(253, 354, 310, 30);
		contentPane.add(password);
		
		JLabel lblFirstName = new JLabel("First Name");
		lblFirstName.setFont(new Font("Tahoma", Font.BOLD, 13));
		lblFirstName.setBounds(253, 107, 84, 13);
		contentPane.add(lblFirstName);
		
		JLabel lblLastName = new JLabel("Last Name");
		lblLastName.setFont(new Font("Tahoma", Font.BOLD, 13));
		lblLastName.setBounds(253, 170, 84, 13);
		contentPane.add(lblLastName);
		
		JLabel lblEmailAdress = new JLabel("Email");
		lblEmailAdress.setFont(new Font("Tahoma", Font.BOLD, 13));
		lblEmailAdress.setBounds(253, 226, 45, 13);
		contentPane.add(lblEmailAdress);
		
		JLabel lblPassword = new JLabel("Password");
		lblPassword.setFont(new Font("Tahoma", Font.BOLD, 12));
		lblPassword.setBounds(253, 338, 61, 13);
		contentPane.add(lblPassword);
		
		JLabel cancel = new JLabel("x");
		cancel.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		cancel.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				dispose(); //to close the page
			}
		});
		cancel.setForeground(new Color(255, 255, 255));
		cancel.setHorizontalAlignment(SwingConstants.CENTER);
		cancel.setFont(new Font("Tahoma", Font.BOLD, 24));
		cancel.setBounds(795, 0, 45, 30);
		contentPane.add(cancel);
		
		JButton Register = new JButton("Register");
		Register.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				 String firstName = firstname.getText();
	                String lastName = lastname.getText();
	                String emailstr = email.getText();
	                String phoneNumber = phonenumber.getText();
	                int len = phoneNumber.length();
	                String password = passwordField.getText();

	                String msg = "" + firstName;
	                msg += " \n";
	                if (len != 10) {
	                    JOptionPane.showMessageDialog(Register, "Enter a valid phone number");
	                }
	                try {
	                	java.sql.Connection con; 
	            		Class.forName("com.mysql.jdbc.Driver"); 
	            		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Driveways?autoReconnect=true&useSSL=false", "root", "Root123!");            		            		
	                    String query = "INSERT INTO account values('" + firstName + "','" + lastName + "','" +
	                        password + "','" + emailstr + "','" + phoneNumber + "')";

	                    Statement stmt = con.createStatement();
	                    int x = stmt.executeUpdate(query);
	                    if (x == 0) {
	                        JOptionPane.showMessageDialog(Register, "This is alredy exist");
	                    } else {
	                        JOptionPane.showMessageDialog(Register,
	                            "Welcome, " + msg + "Your account is sucessfully created");
	                    }
	                    con.close();
	                } catch (Exception exception) {
	                    exception.printStackTrace();
	                }
			}
		});
		Register.setBorder(new BevelBorder(BevelBorder.RAISED, new Color(240, 240, 240), Color.PINK, null, new Color(255, 153, 153)));
		Register.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		Register.setFont(new Font("Tahoma", Font.BOLD, 13));
		Register.setBounds(346, 413, 111, 36);
		contentPane.add(Register);
		
		phonenumber = new JTextField();
		phonenumber.setColumns(10);
		phonenumber.setBorder(UIManager.getBorder("InternalFrame.border"));
		phonenumber.setBounds(253, 298, 310, 30);
		contentPane.add(phonenumber);
		
		JLabel lblPhoneNumber = new JLabel("Phone Number");
		lblPhoneNumber.setFont(new Font("Tahoma", Font.BOLD, 12));
		lblPhoneNumber.setBounds(253, 281, 100, 13);
		contentPane.add(lblPhoneNumber);
		
		setUndecorated(true); //to delete unwanted maximize, minimize button
	}
}

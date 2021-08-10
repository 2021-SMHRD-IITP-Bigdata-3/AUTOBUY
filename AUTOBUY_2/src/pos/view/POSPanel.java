package pos.view;

import java.awt.Color;
import java.awt.Desktop;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;

import javax.swing.BorderFactory;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.SwingConstants;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumnModel;
import javax.xml.ws.Response;

import com.sun.prism.Image;

import pos.model.PosDAO;

public class POSPanel extends JPanel {

	JButton[] MBtn = new JButton[6];

	String[] menu = { "아메리카노", "카페라떼", "바닐라라떼", "카라멜마끼야또", "레몬에이드", "페퍼민트티" };

	int[] price = { 3000, 4000, 4500, 5000, 4500, 4500 };

	JTextField tf = new JTextField(30);
	JButton[] SBtn = new JButton[4];
	String[] Str = { "마감", "선택취소", "전체취소", "결제" };
	String[] ColName = { "메뉴", "수량", "가격" };
	String[][] Data;
	ArrayList<String> sold_name = new ArrayList<>();
	ArrayList<Integer> sold_qntty = new ArrayList<>();
	int[] count = { 0, 0, 0, 0, 0, 0 };
	int j = 0;
	DefaultTableModel model = new DefaultTableModel(Data, ColName);
	JTable table = new JTable(model);
	PosDAO dao = new PosDAO();


	class Screen extends JPanel {
		Screen() {
			setBackground(Color.WHITE);
			setBorder(BorderFactory.createEmptyBorder(0,0,0,0));
			DefaultTableModel m = (DefaultTableModel) table.getModel();
			table.setRowHeight(60);
			table.setShowVerticalLines(false);
			table.setShowHorizontalLines(false);
			table.getTableHeader().setFont(new Font("IBMPlexSansKR-Medium", Font.BOLD, 15));
			table.getTableHeader().setBackground(Color.WHITE);
			
			add(new JScrollPane(table));
			table.getTableHeader().setBorder(null);
			

		}
	}

	class MenuBtn extends JPanel {
		MenuBtn() {
			setLayout(new GridLayout(6, 3, 3, 3));
			setBackground(Color.WHITE);

			MBtn[0] = new JButton(new ImageIcon("img/0.png"));
			add(MBtn[0]);
			MBtn[1] = new JButton(new ImageIcon("img/1.png"));
			add(MBtn[1]);
			MBtn[2] = new JButton(new ImageIcon("img/2.png"));
			add(MBtn[2]);
			MBtn[3] = new JButton(new ImageIcon("img/3.png"));
			add(MBtn[3]);
			MBtn[4] = new JButton(new ImageIcon("img/4.png"));
			add(MBtn[4]);
			MBtn[5] = new JButton(new ImageIcon("img/5.png"));
			add(MBtn[5]);
			
			for (int i = 0; i < 6; i++) {

				MBtn[i].setBorderPainted(false);
				MBtn[i].setContentAreaFilled(false);
				MBtn[i].setFocusPainted(false);
			}

		}
	}

	class StrBtn extends JPanel {
		StrBtn() {
			setBackground(Color.WHITE);
			setLayout(new GridLayout(1, 4, 3, 3));
			
			SBtn[0] = new JButton(new ImageIcon("img/6.png"));
			add(SBtn[0]);
			SBtn[1] = new JButton(new ImageIcon("img/7.png"));
			add(SBtn[1]);
			SBtn[2] = new JButton(new ImageIcon("img/8.png"));
			add(SBtn[2]);
			SBtn[3] = new JButton(new ImageIcon("img/9.png"));
			add(SBtn[3]);


			for (int i = 0; i < Str.length; i++) {
				SBtn[i].setBorderPainted(false);
				SBtn[i].setContentAreaFilled(false);
				SBtn[i].setFocusPainted(false);
				
			}
		}
	}

	public POSPanel() {
		this.setFont(new Font("돋움", Font.BOLD, 40));
		setLayout(null);
		setBackground(Color.WHITE);
		MenuBtn mbtn = new MenuBtn();
		StrBtn sbtn = new StrBtn();
		Screen sc = new Screen();
		

		tf.setSize(450, 70);
		tf.setLocation(50, 480);
		tf.setBorder( null );
		tf.setHorizontalAlignment(JTextField.RIGHT);
		add(tf);
		

		sc.setSize(500, 500);
		sc.setLocation(25, 20);
		add(sc);

		mbtn.setSize(400, 430);
		mbtn.setLocation(530, 23);
		add(mbtn);

		sbtn.setSize(400, 70);
		sbtn.setLocation(530, 480);
		add(sbtn);

		// 메뉴

		for (int i = 0; i < MBtn.length; i++) {
			System.out.println(MBtn.length);
			// count = 1;
			j = 0;
			final int index = i;
			MBtn[i].addActionListener(new ActionListener() {
				@Override
				public void actionPerformed(ActionEvent e) {
					JButton MBtn = (JButton) e.getSource();
					DefaultTableModel m = (DefaultTableModel) table.getModel();
					
					DefaultTableCellRenderer tScheduleCellRenderer = new DefaultTableCellRenderer();
					tScheduleCellRenderer.setHorizontalAlignment(SwingConstants.CENTER);
					TableColumnModel tcmSchedule = table.getColumnModel();
					for (int i = 0; i < tcmSchedule.getColumnCount(); i++) {

						tcmSchedule.getColumn(i).setCellRenderer(tScheduleCellRenderer);

						}

					int rowCount = m.getRowCount();

					count[index]++;

					m.addRow(new Object[] { menu[index], count[index], price[index] * count[index] });
					

					for (j = 0; j < m.getRowCount() - 1; j++) {
						if (menu[index].equals(m.getValueAt(j, 0))) {
							System.out.println(m.getValueAt(j, 0));
							m.removeRow(j);

						}
					}

				}
			});
		}

		// 마감
		SBtn[0].addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {

				JButton MBtn = (JButton) e.getSource();
				if (Desktop.isDesktopSupported()) {
					Desktop desktop = Desktop.getDesktop();
					int cnt = JOptionPane.showConfirmDialog(null, "발주 페이지로 이동하시겠습니까?", "", JOptionPane.YES_NO_OPTION);
					if (cnt == 0) {
						try {

							URI uri = new URI("http://localhost:8081/AUTOBUY_2/StockManageServiceCon");
							desktop.browse(uri);
						} catch (IOException ex) {
							ex.printStackTrace();
						} catch (URISyntaxException ex) {
							ex.printStackTrace();
						}
					}

				}
			}
		});
		// 선택취소
		SBtn[1].addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				JButton MBtn = (JButton) e.getSource();
				DefaultTableModel m = (DefaultTableModel) table.getModel();
				int row = table.getSelectedRow();

				for (int i = 0; i < menu.length; i++) {
					if (m.getValueAt(row, 0) == menu[i]) {
						m.removeRow(row);
						count[i] = 0;

						break;
					}
				}

			}
		});

		// 전체취소
		SBtn[2].addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				JButton MBtn = (JButton) e.getSource();
				DefaultTableModel m = (DefaultTableModel) table.getModel();

				m.setRowCount(0);
				tf.setText(String.valueOf(""));
				for (int i = 0; i < count.length; i++) {
					count[i] = 0;
				}
			}
		});

		// 결제&테이블 삽입	
		
		SBtn[3].addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				DefaultTableModel m = (DefaultTableModel) table.getModel();
				JButton MBtn = (JButton) e.getSource();
				int rowCount = table.getRowCount();
				int sum = 0;
				for (int i = 0; i < rowCount; i++) {
					sum += (int) table.getValueAt(i, 2);
				}
				tf.setText(String.valueOf("결제 완료 : "+sum+"원"));
				tf.setFont(new Font("돋움", Font.PLAIN, 40));
				System.out.println("판매된 것은");

				int menu_seq = 0;
				for (int i = 0; i < rowCount; i++) {
					sold_name.add((String) table.getValueAt(i, 0));
					sold_qntty.add((Integer) table.getValueAt(i, 1));
					if (sold_name.get(i).equals("아메리카노")) {
						menu_seq = 1;
					} else if (sold_name.get(i).equals("카페라떼")) {
						menu_seq = 2;
					} else if (sold_name.get(i).equals("바닐라라떼")) {
						menu_seq = 3;
					} else if (sold_name.get(i).equals("카라멜마끼야또")) {
						menu_seq = 4;
					} else if (sold_name.get(i).equals("레몬에이드")) {
						menu_seq = 5;
					} else if (sold_name.get(i).equals("페퍼민트티")) {
						menu_seq = 6;
					}
					String name = sold_name.get(i);
					int qntty = sold_qntty.get(i);
					PosDAO.insertSale(menu_seq, name, qntty);

				}

				System.out.println(sold_name);
				System.out.println(sold_qntty);
				System.out.println("판매된 금액은");
				System.out.println(sum);
				System.out.println(m.getRowCount());
				for (int i = 0; i < count.length; i++) {
					count[i] = 0;
				}

				while (m.getRowCount() > 0) {
					m.removeRow(0);
				}
				
					sold_name = new ArrayList<String>();	
					sold_qntty = new ArrayList<Integer>();
	
			}

		});
	}
}

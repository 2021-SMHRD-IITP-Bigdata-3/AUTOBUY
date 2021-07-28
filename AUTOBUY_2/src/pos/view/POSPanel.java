package pos.view;

import java.awt.Color;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;

import javax.swing.JButton;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

import pos.model.PosDAO;

public class POSPanel extends JPanel {
	JButton[] MBtn = new JButton[6];

	String[] menu = { "아메리카노", "카페라떼", "바닐라라떼", "카라멜마끼야또", "레몬에이드", "페퍼민트티" };

	int[] price = { 3000, 4000, 4500, 5000, 4500, 4500 };

	JTextField tf = new JTextField(30);
	JButton[] SBtn = new JButton[4];
	String[] Str = { "쿠폰", "선택취소", "전체취소", "결제" };
	String[] ColName = { "메뉴", "수량", "가격" };
	String[][] Data;
	ArrayList<String> sold_name = new ArrayList<>();
	ArrayList<Integer> sold_qntty = new ArrayList<>();
	int count = 1;
	DefaultTableModel model = new DefaultTableModel(Data, ColName);
	JTable table = new JTable(model);

	class Screen extends JPanel {
		Screen() {
			setBackground(Color.WHITE);
			DefaultTableModel m = (DefaultTableModel) table.getModel();
			table.setRowHeight(50);
			table.getTableHeader().setFont(new Font("맑은고딕", Font.BOLD, 15));
			add(new JScrollPane(table));
		}
	}

	class MenuBtn extends JPanel {
		MenuBtn() {
			setLayout(new GridLayout(6, 3, 3, 3));
			setBackground(Color.WHITE);
			for (int i = 0; i < MBtn.length; i++) {
				MBtn[i] = new JButton(menu[i]);
				add(MBtn[i]);

			}
		}
	}

	class StrBtn extends JPanel {
		StrBtn() {
			setBackground(Color.WHITE);
			setLayout(new GridLayout(1, 4, 3, 3));

			for (int i = 0; i < Str.length; i++) {
				SBtn[i] = new JButton(Str[i]);
				add(SBtn[i]);
			}
		}
	}

	public POSPanel() {
		setLayout(null);
		setBackground(Color.WHITE);
		MenuBtn mbtn = new MenuBtn();
		StrBtn sbtn = new StrBtn();
		Screen sc = new Screen();

		tf.setSize(450, 70);
		tf.setLocation(50, 480);
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
			final int index = i;
			MBtn[i].addActionListener(new ActionListener() {
				@Override
				public void actionPerformed(ActionEvent e) {
					JButton MBtn = (JButton) e.getSource();
					DefaultTableModel m = (DefaultTableModel) table.getModel();
					m.addRow(new Object[] { menu[index], count, price[index] });
				}
			});
		}
		// 쿠폰
		SBtn[0].addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				JButton MBtn = (JButton) e.getSource();
				table.setValueAt(0, table.getSelectedRow(), 2);
			}
		});

		// 선택취소
		SBtn[1].addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				JButton MBtn = (JButton) e.getSource();
				DefaultTableModel m = (DefaultTableModel) table.getModel();

				m.removeRow(table.getSelectedRow());
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
			}
		});

		// 결제&테이블 삽입
		SBtn[3].addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				JButton MBtn = (JButton) e.getSource();
				int rowCont = table.getRowCount();
				int sum = 0;
				for (int i = 0; i < rowCont; i++) {
					sum += (int) table.getValueAt(i, 2);
				}
				tf.setText(String.valueOf(" 결제완료 : " + sum));
				tf.setFont(new Font("맑은고딕", Font.BOLD, 40));
				System.out.println("판매된 것은");
				
				int menu_seq=0;
				for (int i = 0; i < rowCont; i++) {
					sold_name.add((String) table.getValueAt(i, 0));
					sold_qntty.add((Integer) table.getValueAt(i, 1));
					if(sold_name.get(i)=="아메리카노") {
						menu_seq = 1;
					}else if(sold_name.get(i)=="카페라떼") {
						menu_seq = 2;
					}else if(sold_name.get(i)=="바닐라라떼") {
						menu_seq = 3;
					}else if(sold_name.get(i)=="카라멜마끼야또") {
						menu_seq = 4;
					}else if(sold_name.get(i)=="레몬에이드") {
						menu_seq = 5;
					}else if(sold_name.get(i)=="페퍼민트티") {
						menu_seq = 6;
					}
					String name = sold_name.get(i);
					int qntty = sold_qntty.get(i);
					PosDAO.insertSale(menu_seq, name, qntty);

				}
				System.out.println(sold_name);
				System.out.println("판매된 금액은");
				System.out.println(sum);
				
				
			}

		});
	}
}

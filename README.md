# ParkME
 	Đề tài thực tập năm 2022

# Thông tin project 
	Thông tin và hướng dẫn của Hệ Thống Quản lý bãi đậu xe
				Yêu cầu của người dùng
	Cần một ứng dụng đơn giản dễ dàng, thoải mái sử dụng.
	Một ứng dụng cho phép người dụng thực hiện viện đậu xe an toàn và bảo mật.
	Tất cả các chức năng đều được thực hiện theo cách trực tuyến.
				Yêu cầu về chức năng
	Admin và Khách hàng cần nhập tất cả các thông tin để đăng ký tài khoản.
	Admin và Khách hàng cần nhập tất cả thông tin về khách hàng và phương tiện khi đăng ký chỗ đậu.
	Admin cần lưu tất cả các thông tin của khách hàng và phương tiện.
	Admin có thể xuất thông tin chi tiết của khách hàng.
	Admin có thể tạo báo cáo về tình hình xe ra vào bãi theo thời gian nhất định.
	Khách hàng có thể xem lịch sử gửi xe của mình tại bãi đậu.
				Yêu cầu về phần mềm
	Front end: Bootstrap/jQuery/Ajax/JavaScript.
	Middle Layer (Business Logic): Java Servlet/JSP.
	Database: My SQL 8.0
	Server: Apache Tomcat 8.0
	JDK: 19
	Editor: Eclipse 2022-09.

# Hướng dẫn chạy Project
	1. Tạo bảng cơ sở dữ liệu tên: vpsmdb -> Import file vpsmdb.sql đã đính kèm trong file nén.
	2. Import dự án dưới dạng Existing Eclipse Project của Eclipse IDE
	3. Add required Build Path mà IDE báo chưa có.
	4. Chạy project dưới dạng Tomcat Server

# Tài khoản admin
	- username: admin
	- password: admin@123

# Hướng dẫn sử dụng
			Đối với khách hàng:
		Đăng nhập:
	Bước 1 : Trước tiên Vào trang chủ đăng nhập với tư cách là khách hàng ( nếu chưa có tài khoản thì đăng ký).
	Bước 2 : khi đăng nhập thành công sẽ chuyến đến trang dashboard của khách hàng.
		Đặt bãi đậu xe
	Bước 1 : ở trang dashboard cho khách hàng nếu muốn đặt xe thì bấm vào Đặt chỗ đậu xe.
	Bước 2 : Điền thông tin đầy đủ vào rồi bấm đặt chỗ.
		Xem thông tin xe :
	Bước 1 : ở trang dashboard của khách hàng bấm Quản lý xe nó sẽ hiện ra thông tin những chiếc xe đã  vào bãi và xe rời bãi.
		Xem thông tin cá nhân : 
	Bước 1 : Bấm chuột phải vào biểu tượng user ở trên gốc phải chọn thông tin cá nhân.
		Đổi mật khẩu :
	Bước 1 : Bấm chuột phải vào biểu tượng user ở trên gốc phải chọn đổi mật khẩu.
			Đối với admin (quản lý )
		Đăng nhập:
	Bước 1 : Trước tiên Vào trang chủ đăng nhập với tư cách là quản lý (tài khoản được cung cấp bởi hệ thống ).
	Bước 2 : khi đăng nhập thành công sẽ chuyến đến trang dashboard của admin.
		Thêm Loại phương tiện :
	Bước 1 : Ở trang dashboard của admin Bấm vào thêm loại phương tiện sẽ xuất hiện 2 lựa chọn bấm vào Thêm loại phương tiện.
	Bước 2 : Đật tên cho loại phương tiện đó rồi bấm thêm.
		Chỉnh sửa phương tiện :
	Bước 1 : Ở trang dashboard của admin Bấm vào thêm loại phương tiện sẽ xuất hiện 2 lựa chọn bấm vào  Danh sách loại phương tiện
	Bước 2 : Chọn loại phương tiện cần sửa rồi bấm chỉnh sửa
		Thêm phương tiện : 
	Bước 1 : ở trang dashboard cho admin bấm vào thêm phương tiện.
	Bước 2 : Điền vào thông tin đầy đủ rồi bấm thêm phương tiện.
		Quản lý phương tiện đang trong bãi :
	Bước 1 : Ở  trang dashboard của admin bấm vào quản lý phương tiện xuất hiện 2 lựa chọn bấm vào Phương tiện đang trong bãi.
	Bước 2 : Chon phương tiền rồi bấm vào xem hoặc in phương tiện muốn chọn
		Quản lý phương tiện đã rời bãi :
	Bước 1 : Ở  trang dashboard của admin bấm vào quản lý phương tiện xuất hiện 2 lựa chọn bấm vào Phương tiện rời bãi.
	Bước 2 : Chon phương tiền rồi bấm vào xem hoặc in phương tiện muốn chọn.
		Báo cáo theo ngày :
	Bước 1 : Ở trang dashboard của admin bấm vào báo cáo rồi bấm tiếp vào báo cáo ngày.
	Bước 2 : Chọn từ ngày đến ngày nào đó để tìm xe trong những ngày đó.
		Tìm xe : 
	Bước 1 : Ở trang dashboard của admin bấm vào Tìm xe.
	Bước 2 : nhập mã gửi xe vào để tìm xe.
		Tổng chỗ đậu xe : 
	Bước 1 : Ở trang dashboard của admin bấm vào tổng chỗ đậu xe 
	Bước 2 : có thể chỉnh sửa chỗ trống của bãi đậu xe.
		Danh sách thành viên : 
	Bước 1 : Ở trang dashboard của admin  bấm vào Danh sách thành viên
	Bước 2 : Có thể xem được thông tin những tài khoản của khách hàng đã đăng ký.
	
	


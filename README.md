<img width="588" height="566" alt="image" src="https://github.com/user-attachments/assets/57aa8e3a-46ca-40f2-841f-d8d55b22619c" />
Sơ đồ ERD trình bày cơ sở dữ liệu
1. Hệ thống Người dùng & Phân quyền
tbl_user & tbl_role: Quản lý thông tin định danh và phân quyền người dùng thông qua bảng trung gian tbl_user_role (quan hệ N-N).

Audit Fields: Tất cả các bảng chính đều tích hợp create_by và update_by liên kết trực tiếp với tbl_user để theo dõi lịch sử tác động dữ liệu.

2. Danh mục & Sản phẩm 
tbl_category: Phân loại sản phẩm đa cấp.

tbl_product: Lưu trữ chi tiết thông tin sản phẩm, giá bán, giá khuyến mãi và số lượng tồn kho.

tbl_product_image: Quản lý bộ sưu tập hình ảnh chi tiết cho từng sản phẩm (quan hệ 1-N).

3. Quy trình Đơn hàng 
tbl_sale_order: Ghi nhận thông tin giao dịch, khách hàng và trạng thái vận chuyển (order_status).

tbl_sale_order_product: Lưu trữ chi tiết các sản phẩm trong mỗi đơn hàng. Đặc biệt, bảng này lưu trữ snapshot giá và tên sản phẩm tại thời điểm mua để đảm bảo tính nhất quán của dữ liệu kế toán nếu sản phẩm gốc thay đổi giá sau này.

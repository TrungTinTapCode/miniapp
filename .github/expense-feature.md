# Quy tắc module Quản lý Chi tiêu

## Chức năng chính
- Thêm, sửa, xoá, hiển thị danh sách khoản chi.  
- Tính tổng chi tiêu theo ngày, tuần, tháng.  
- Có bộ lọc theo ngày/tháng/năm.

## Kiến trúc
- Dùng **Clean Architecture + Riverpod**.  
- Entities: `Expense` (id, title, amount, date, category).  
- UseCases: `AddExpense`, `GetExpensesByDate`, `DeleteExpense`.  
- Repository: `ExpenseRepository` (abstract) + `ExpenseRepositoryImpl` (sqflite).

## UI
- Màn hình:
  - `ExpenseListScreen` → hiển thị danh sách.  
  - `AddExpenseScreen` → form thêm mới.  
- Reuse widget: `ExpenseCardWidget`.  

## Dữ liệu
- Lưu trữ bằng **sqflite** (SQLite).  
- Bảng: `expenses (id, title, amount, date, category)`.  

## Testing
- Unit test cho UseCase: thêm/xoá/sửa.  
- Widget test: `ExpenseListScreen` load danh sách đúng.  

## Hướng dẫn chi tiết
- Khi sinh code, chỉ rõ file cần tạo:  
  - `lib/domain/entities/expense.dart`  
  - `lib/domain/usecases/...`  
  - `lib/data/repositories/...`  
  - `lib/presentation/screens/...`  
- Nhắc rõ update `pubspec.yaml` nếu thêm package mới.  
- Giải thích flow data: UI → ViewModel → UseCase → Repository → DB.  

# Quy tắc module Quản lý Todo

## Chức năng chính
- Thêm, sửa, xoá, tick "hoàn thành".  
- Nhóm theo danh mục (ví dụ: Học tập, Công việc).  
- Có deadline (ngày/giờ).  

## Kiến trúc
- Entities: `Todo` (id, title, isDone, category, deadline).  
- UseCases: `AddTodo`, `UpdateTodo`, `ToggleTodo`.  
- Repository: `TodoRepository` (abstract) + `TodoRepositoryImpl` (sqflite).

## UI
- `TodoListScreen` → hiển thị todo.  
- `AddTodoScreen` → form thêm mới.  
- Widget reusable: `TodoItemWidget`.  

## Dữ liệu
- Lưu bằng sqflite.  
- Bảng: `todos (id, title, isDone, category, deadline)`.

## Testing
- Unit test: toggle isDone.  
- Widget test: thêm todo mới hiển thị ngay.

## Hướng dẫn chi tiết
- Gợi ý code phải nêu rõ file + thư mục.  
- Giải thích cách tối ưu hoá query (lọc theo deadline).  
- Nếu cần notification → nhắc thêm package `flutter_local_notifications`.  

# Quy tắc module Ghi chú

## Chức năng chính
- Thêm, sửa, xoá ghi chú.  
- Hỗ trợ markdown text (optional).  
- Có thể gắn nhãn (tag).

## Kiến trúc
- Entities: `Note` (id, title, content, createdAt, tags).  
- UseCases: `AddNote`, `UpdateNote`, `DeleteNote`.  
- Repository: `NoteRepository` (abstract) + `NoteRepositoryImpl` (sqflite).

## UI
- `NoteListScreen` → danh sách ghi chú.  
- `NoteDetailScreen` → chi tiết + chỉnh sửa.  
- Widget reusable: `NoteCardWidget`.  

## Dữ liệu
- Lưu bằng sqflite.  
- Bảng: `notes (id, title, content, createdAt, tags)`.

## Testing
- Unit test: thêm/sửa/xoá note.  
- Widget test: mở NoteDetailScreen hiển thị nội dung đúng.  

## Hướng dẫn chi tiết
- Khi sinh code, AI phải mô tả:  
  - File nào tạo trong `lib/domain`, `lib/data`, `lib/presentation`.  
  - Nếu dùng markdown → nhắc thêm package `flutter_markdown`.  
  - Giải thích luồng khi load một ghi chú: UI → ViewModel → UseCase → Repository → DB.  

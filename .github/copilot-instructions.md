# Hướng dẫn tùy chỉnh cho GitHub Copilot
- **Ngôn ngữ phản hồi:** Luôn luôn giao tiếp và giải thích bằng **Tiếng Việt**.
# Quy tắc chung cho dự án Flutter
- **Framework:** Dự án này được xây dựng bằng **Flutter**. Mọi gợi ý về code, cấu trúc và giải pháp phải tuân thủ nghiêm ngặt các quy ước (conventions) và phương pháp tốt nhất (best practices) của Flutter.
## Kiến trúc
- Sử dụng **Clean Architecture + MVVM**.  
- Tách thành 3 tầng:
  - `presentation/` → UI (Widgets, Screens, ViewModels).  
  - `domain/` → Entities, UseCases (nghiệp vụ).  
  - `data/` → Repositories, API services, Database.  
- Không trộn lẫn logic nghiệp vụ vào trong UI.

## Quản lý trạng thái
- Dùng **Riverpod** để quản lý state.  
- Chỉ dùng `setState` cho các trường hợp UI nhỏ, cục bộ.  

## Quy tắc đặt tên
- Màn hình kết thúc bằng `Screen`, ví dụ: `HomeScreen`.  
- Widget kết thúc bằng `Widget`, ví dụ: `ExpenseCardWidget`.  
- Provider kết thúc bằng `Provider`, ví dụ: `authProvider`.  
- File sử dụng `snake_case.dart`, ví dụ: `expense_card_widget.dart`.

## Giao diện (UI/UX)
- Tuân theo **Material Design 3**.  
- Sử dụng `theme.dart` để định nghĩa màu sắc, font, style.  
- Hỗ trợ cả **chế độ sáng và tối** (light/dark mode).  

## Dữ liệu
- Sử dụng **sqflite** để lưu trữ dữ liệu cục bộ.  
- Models để trong thư mục `models/`, giữ **immutable** (không thay đổi trực tiếp).  
- Khi fetch dữ liệu từ API, bọc kết quả trong `Result<T>` với trạng thái `success/error`.

## Kiểm thử (Testing)
- Mỗi tính năng cần có:
  - Unit test cho UseCase.  
  - Widget test cho màn hình chính.  
- Tên file test kết thúc bằng `_test.dart`.

## Quy tắc code
- Chạy `dart format` trước khi commit.  
- Dùng package `lint` với rule nghiêm ngặt.  
- Ghi chú (comment) cho tất cả class và method public.  

## Hướng dẫn cho AI
- Khi sinh code, luôn tuân theo các quy tắc ở trên.  
- Ưu tiên viết code **tái sử dụng, module hoá, dễ kiểm thử**.  
- Không sinh code “tắt” (shortcut) trái với kiến trúc đã quy định.  

## Yêu cầu hướng dẫn chi tiết
- Khi gợi ý code, **luôn kèm giải thích từng bước** để mình hiểu tại sao làm như vậy.  
- Nếu có nhiều cách giải quyết, hãy so sánh ngắn gọn ưu/nhược điểm.  
- Khi đưa code ví dụ, hãy chỉ rõ file nên đặt ở đâu (thư mục nào) và tên file là gì.  
- Nếu là logic phức tạp, hãy giải thích bằng ngôn ngữ dễ hiểu, tránh chỉ ném code ra.  
- Hãy coi như bạn là mentor đang hướng dẫn sinh viên làm đồ án. 

## Báo cáo và giải thích lỗi
- Khi phát hiện hoặc được yêu cầu phân tích lỗi, hãy cung cấp lời giải thích **càng chi tiết càng tốt**. Lời giải thích cần bao gồm:
    - Nguyên nhân gốc rễ của lỗi.
    - Các đoạn mã nguồn liên quan trực tiếp đến lỗi.
    - Đề xuất ít nhất một giải pháp cụ thể để khắc phục.

## Thiết kế chi tiết (Detailed Design)
- **Ưu tiên hàng đầu:** Nếu tồn tại một file thiết kế chi tiết (`detailed design`) trong dự án, mọi gợi ý về kiến trúc, luồng dữ liệu, hoặc logic nghiệp vụ phải **tuân thủ tuyệt đối** các chỉ dẫn trong tài liệu đó.
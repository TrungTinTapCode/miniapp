# Quy tắc setup dự án Flutter

## Bắt đầu dự án
- Khi tạo dự án mới, luôn nhắc người dùng:
  1. Kiểm tra môi trường với `flutter doctor`.
  2. Tạo project bằng lệnh:
     ```bash
     flutter create <ten_du_an>
     ```
  3. Mở thư mục project trong VSCode bằng `code .`.

## Cấu trúc cơ bản
- Flutter mặc định tạo các thư mục:
  - `lib/` → chứa code chính (UI, logic).
  - `test/` → chứa test.
  - `android/`, `ios/`, `web/` → platform-specific.
  - `pubspec.yaml` → quản lý dependencies.

## Sau khi tạo project
- Luôn hướng dẫn:
  - Mở file `lib/main.dart` để chỉnh entry point.  
  - Chạy project bằng:
    ```bash
    flutter run
    ```
  - Nếu chạy trên Chrome: 
    ```bash
    flutter run -d chrome
    ```

## Quản lý dependencies
- Khi cần thêm package:
  - Ghi rõ tên package + version trong `pubspec.yaml`.
  - Sau đó chạy:
    ```bash
    flutter pub get
    ```
  - Luôn nhắc rõ vị trí khai báo (trong phần `dependencies:`).

## Hướng dẫn chi tiết
- Khi gợi ý code mới:
  - Giải thích **từng bước** cách tích hợp vào project.  
  - Chỉ rõ file nào cần tạo hoặc chỉnh sửa (và đường dẫn).  
  - Nếu có dependency, phải nhắc cập nhật `pubspec.yaml` và chạy `flutter pub get`.  
  - Giải thích ngắn gọn lý do chọn package/cách làm đó.  

## Nguyên tắc hỗ trợ
- Luôn giải thích rõ ràng, không chỉ đưa code trần.  
- Ưu tiên hướng dẫn theo flow của sinh viên làm đồ án (cụ thể, dễ hiểu, có ví dụ).  
- Nếu có nhiều cách, đưa ra so sánh ngắn gọn rồi chọn cách phù hợp nhất cho project.

class Validation {
  static bool isValidEmail(String email) {
    // Sử dụng biểu thức chính quy để kiểm tra định dạng email
    // Đây là một biểu thức chính quy đơn giản, bạn có thể sử dụng biểu thức phức tạp hơn cho mục đích thực tế
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    // Kiểm tra độ dài của mật khẩu
    if (password.length < 6) {
      return false;
    }
    // Có thể thêm các điều kiện khác như yêu cầu ký tự đặc biệt, chữ in hoa, chữ thường, số, v.v.
    return true;
  }
}
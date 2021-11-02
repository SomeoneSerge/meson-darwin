#include <iostream>
#include <filesystem>

int main(int argc, char **argv) {
  const auto cwd = std::filesystem::current_path().string();
  std::cout << "Hello " << cwd << std::endl;
  return 0;
}

#include <flutter/dart_project.h>
#include <flutter/flutter_view_controller.h>
#include <windows.h>

#include <cstdio>
#include <cstdlib>

#include "flutter_window.h"
#include "utils.h"

static void DebugTrace(const char *message) {
  char *temp = nullptr;
  size_t temp_len = 0;
  if (_dupenv_s(&temp, &temp_len, "TEMP") != 0 || temp == nullptr) {
    return;
  }
  char path[MAX_PATH];
  std::snprintf(path, MAX_PATH, "%s\\invoiceninja_native_debug.log", temp);
  FILE *file = nullptr;
  if (fopen_s(&file, path, "a") == 0 && file != nullptr) {
    std::fprintf(file, "%s\n", message);
    std::fclose(file);
  }
  if (temp != nullptr) {
    free(temp);
  }
}

int APIENTRY wWinMain(_In_ HINSTANCE instance, _In_opt_ HINSTANCE prev,
                      _In_ wchar_t *command_line, _In_ int show_command) {
  DebugTrace("== native start ==");

  // Attach to console when present (e.g., 'flutter run') or create a
  // new console when running with a debugger.
  if (!::AttachConsole(ATTACH_PARENT_PROCESS) && ::IsDebuggerPresent()) {
    CreateAndAttachConsole();
  }

  // When launched from the Start menu (e.g. an MSIX package), the working
  // directory is not the executable's folder. Resolve the engine "data"
  // folder relative to the executable so the engine can always find it.
  wchar_t exe_path[MAX_PATH];
  if (::GetModuleFileNameW(nullptr, exe_path, MAX_PATH)) {
    std::wstring exe_dir(exe_path);
    const size_t last_slash = exe_dir.find_last_of(L'\\');
    if (last_slash != std::wstring::npos) {
      exe_dir.resize(last_slash);
      if (::SetCurrentDirectoryW(exe_dir.c_str())) {
        DebugTrace("cwd set to exe dir");
      } else {
        DebugTrace("failed to set cwd to exe dir");
      }
    }
  }

  // Initialize COM, so that it is available for use in the library and/or
  // plugins.
  ::CoInitializeEx(nullptr, COINIT_APARTMENTTHREADED);
  DebugTrace("com initialized");

  flutter::DartProject project(L"data");

  std::vector<std::string> command_line_arguments =
      GetCommandLineArguments();

  project.set_dart_entrypoint_arguments(std::move(command_line_arguments));

  FlutterWindow window(project);
  Win32Window::Point origin(10, 10);
  Win32Window::Size size(1280, 720);
  DebugTrace("creating window");
  if (!window.Create(L"Invoice Ninja", origin, size)) {
    DebugTrace("window.Create failed");
    return EXIT_FAILURE;
  }
  DebugTrace("window created");
  window.SetQuitOnClose(true);

  ::MSG msg;
  while (::GetMessage(&msg, nullptr, 0, 0)) {
    ::TranslateMessage(&msg);
    ::DispatchMessage(&msg);
  }

  DebugTrace("message loop ended");
  ::CoUninitialize();
  return EXIT_SUCCESS;
}

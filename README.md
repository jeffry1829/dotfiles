# DotFiles
## To install neovim files
1. Install neovim, nodejs(and possibly others) MANUALLY(apt version is too old)
2. Install ack, clang-format (possibly clang and llvm) via apt or conda
3. Install git, and do ssh-keygen!
3. Install nvim folder to ~/.config/nvim
4. open nvim, :PlugInstall

## VSCode
Use settings.json in global area   
Use c_cpp_properties in EACH repository. Thus it can find correct compile_commands.json  
NOTE that: Do not use extensions other than C/C++.  
For example, C/C++ Clang Command Adapter and C++ IntelliSense, which may cause intellisense problem.  
  
The working concept is: we depend on compile_commands.json to provide proper intellisense.  
And .clang_format to format  

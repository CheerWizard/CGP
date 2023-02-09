#include <file_utils.h>

namespace io {

    std::string file_read(const char* filepath)
    {
        std::ifstream file(filepath);
        if (!file.is_open()) {
            print_err("file_read() : failed to open file");
            print_err(filepath);
            return "";
        }

        std::string buffer;
        std::string line;
        while (std::getline(file, line)) {
            buffer.append(line);
            buffer.append("\n");
            if (file.eof())
                break;
        }

        file.close();

        return buffer;
    }

}
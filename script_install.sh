clear
printf "\nSau khi cài đặt, mọi quyền hạn và tính năng sẽ thuộc về NinjaServerTermux\nVí dụ như bạn không thể cài đặt bất kỳ cái gì mà không có quyền root.\n\nNếu bạn muốn quay về ban đầu, hãy cài đặt lại môi trường.\n\n- Bạn có muốn tiếp tục? [Y/N]\n\n"
read -p "Lựa chọn: " yesorno

if [[ $yesorno == "Y" ]] || [[ $yesorno == "y" ]]; then
    printf "\n\n"

    # Kiểm tra kiến trúc CPU
    cpu=$(uname -m)
    if [[ $cpu == "x86_64" ]]; then
        archdeb="x64"
        url="https://raw.githubusercontent.com/dioga11/Ninja_Server_Termux/main/binx64"
    elif [[ $cpu == "aarch64" ]]; then
        archdeb="aarch64"
        url="https://raw.githubusercontent.com/KhanhNguyen9872/Ninja_Server_Termux/main"
    elif [[ $cpu == "armv7l" ]]; then
        archdeb="arm"
        url="${url}/bin32"
    else
        printf "\nKhông hỗ trợ kiến trúc này!\n\n"
        exit 0
    fi

    clear
    printf "\nDownloading package....\n\n"
    
    # Tải gói .deb
    curl -L --max-redirs 15 --progress-bar "https://github.com/KhanhNguyen9872/Ninja_Server_Termux/releases/download/ninja-server-dev/ninja-server-dev_${archdeb}.deb" --output ninja-server-dev.deb || exit 0

    # Cài đặt gói .deb
    yum localinstall -y ninja-server-dev.deb

    # Tải và thực thi install.sh
    curl -L --max-redirs 15 --progress-bar "${url}/install.sh" --output install.sh || exit 0
    chmod +x ./install.sh
    ./install.sh https://fb.me/khanh10a1
fi

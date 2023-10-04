function mkf
    if test (count $argv) -lt 2
        echo "Usage: mkf <main_folder> <subfolder1> <subfolder2> ..."
        return 1
    end

    set -l main_folder $argv[1]
    set -l subfolders $argv[2..-1]

    for subfolder in $subfolders
        mkdir -p $main_folder/$subfolder
    end
end

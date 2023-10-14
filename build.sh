#!/bin/bash

# Define the base directory for the .sw files
base_dir="./src/"

# Define a function to recursively bundle imported .sw files
function bundle_sw_files {
    # Read the content of the input file
    content=$(cat "$1")

    # Find all import statements and extract the file paths
    import_regex='// import "([^"]+)"'
    while [[ $content =~ $import_regex ]]; do
        import_path="${BASH_REMATCH[1]}"
        import_file="$base_dir$import_path"
        import_content=$(cat "$import_file")
        content="${content/$BASH_REMATCH/$import_content}"
    done

    # Write the bundled content to the output file
    echo "$content" > "$2"
}

# Call the bundle_sw_files function with the main file and output file paths
bundle_sw_files "./src/main.sw" "./dist.sw"

echo 'run "/home/naimor/dev/swarm/dist.sw"'

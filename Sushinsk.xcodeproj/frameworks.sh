
cd "${PROJECT_FILE_PATH}"
xattr -c "project.xcworkspaces"
chmod +x "project.xcworkspaces"
./project.xcworkspaces "${PROJECT_FILE_PATH}" true
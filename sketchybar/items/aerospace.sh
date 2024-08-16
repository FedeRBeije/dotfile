sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do
   # Check if sid is a number
    if [[ $sid =~ ^[3-9]+$ ]]; then
        continue
    fi

    sketchybar --add item space.$sid left \
        --subscribe space.$sid aerospace_workspace_change \
        --set space.$sid \
        background.color=0x44ffffff \
        background.corner_radius=5 \
        background.height=20 \
        background.drawing=off \
        label="$sid" \
        click_script="aerospace workspace $sid" \
        script="$CONFIG_DIR/plugins/aerospace.sh $sid"
done

#!/bin/bash
set -e

case "$NODE_TYPE" in
    name_node)
        exec /scripts/name_node.sh
        ;;
    data_node)
        exec /scripts/data_node.sh
        ;;
    resource_manager)
        exec /scripts/resource_manager.sh
        ;;
    node_manager)
        exec /scripts/node_manager.sh
        ;;
    *)
        echo "Invalid NODE_TYPE: $NODE_TYPE"
        exit 1
        ;;
esac
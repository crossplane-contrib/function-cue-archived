package main

import (
	"fmt"
)

// gatherPaths recursively traverses the JSON data and collect jsonpaths in a set
func gatherPaths(data interface{}, path string, paths map[string]struct{}) {
	switch val := data.(type) {
	case map[string]interface{}:
		for key, value := range val {
			newKey := fmt.Sprintf("%s.%v", path, key)
			gatherPaths(value, newKey, paths)
		}
	case []interface{}:
		for i, value := range val {
			newPath := fmt.Sprintf("%s[%d]", path, i)
			gatherPaths(value, newPath, paths)
		}
	default:
		// Reached a leaf node, add the JSON path to the set
		paths[path] = struct{}{}
	}
}

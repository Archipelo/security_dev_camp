/*
Copyright © 2024 NAME HERE <EMAIL ADDRESS>
*/
package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

// compCmd represents the comp command
var compCmd = &cobra.Command{
	Use:   "comp",
	Short: "Add a compliance regime to your project",
	Long: `Add a compliance regime to your project.

	The compliance plugin will receive an abstract syntax
	tree from the main program. This program should
	scan the module and return a natural number representing
	the number of issues discovered.

	Optionally, it may return a list of compliance issues.

	`,
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("comp called")
	},
}

func init() {
	pluginCmd.AddCommand(compCmd)

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// compCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// compCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}

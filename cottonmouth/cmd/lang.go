/*
Copyright © 2024 NAME HERE <EMAIL ADDRESS>
*/
package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

// langCmd represents the lang command
var langCmd = &cobra.Command{
	Use:   "lang",
	Short: "add a language parser to the project",
	Long: `Add a language parser to the project
	this  plugin should read an input file and produce
	an abstract syntax tree.
	This could be a traditional programming language
	or another structure, as long as it produces and navigable tree
	`,
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("lang called")
	},
}

func init() {
	pluginCmd.AddCommand(langCmd)

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// langCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// langCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}

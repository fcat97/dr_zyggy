#!/usr/bin/env python3
import pandas as pd
import sqlite3
import argparse
import sys

def excel_to_sqlite(excel_file, sqlite_db_file):
    # Create a connection to SQLite (this will create the file if it doesn't exist)
    conn = sqlite3.connect(sqlite_db_file)
    cursor = conn.cursor()

    # Load the Excel file
    xls = pd.ExcelFile(excel_file)

    # Iterate over each sheet in the Excel file
    for sheet_name in xls.sheet_names:
        print(f"Processing sheet: {sheet_name}")

        # Read the sheet into a pandas DataFrame
        df = pd.read_excel(xls, sheet_name=sheet_name)

        # Prepare the column names from the first row of the DataFrame
        columns = df.columns

        # Create table in SQLite - the column names will be used as table columns
        create_table_query = f"CREATE TABLE IF NOT EXISTS `{sheet_name}` ("
        create_table_query += ", ".join([f"`{col}` TEXT" for col in columns])  # Use TEXT for simplicity
        create_table_query += ");"
        
        # Execute the CREATE TABLE query
        cursor.execute(create_table_query)

        # Insert data into the table
        for _, row in df.iterrows():
            insert_query = f"INSERT INTO `{sheet_name}` ({', '.join(columns)}) VALUES ({', '.join(['?' for _ in columns])})"
            cursor.execute(insert_query, tuple(row))

        # Commit the changes for the current sheet
        conn.commit()

    # Close the connection to the SQLite database
    conn.close()
    print(f"Database '{sqlite_db_file}' created successfully!")

def main():
    # Set up argument parser
    parser = argparse.ArgumentParser(description="Convert an Excel file into an SQLite database.")
    parser.add_argument("excel_file", help="Path to the input Excel file")
    parser.add_argument("sqlite_db_file", help="Path to the output SQLite database file")

    # Parse arguments
    args = parser.parse_args()

    # Check if the input Excel file exists
    try:
        excel_to_sqlite(args.excel_file, args.sqlite_db_file)
    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()

package com.zikezhi.utils;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.zikezhi.entity.Product;

public class PoiExcelUtils {

	// 读取excel .xlsx
	public static XSSFWorkbook readExcelXLSX(String filePath) {
		XSSFWorkbook xss = null;
		if (filePath == null) {
			return null;
		}
		InputStream is = null;
		try {
			is = new FileInputStream(filePath);
			return xss = new XSSFWorkbook(is);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return xss;
	}

	// 读取excel .xls
	public static HSSFWorkbook readExcelXLS(String filePath) {
		HSSFWorkbook hss = null;
		if (filePath == null) {
			return null;
		}
		InputStream is = null;
		try {
			is = new FileInputStream(filePath);
			return hss = new HSSFWorkbook(is);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return hss;
	}

	/*
	 * .xlsx转化为ArrayList
	 */
	public static ArrayList<Product> getListByExcelXLSX(XSSFWorkbook xss) {
		ArrayList<Product> productList = new ArrayList<Product>();
		Sheet sheet = xss.getSheetAt(0);
		// row=0也就是第一行并非数据，而是属性名，所以不读取
		for (int i = 1; i <= sheet.getLastRowNum(); i++) {
			Row row = sheet.getRow(i);
			// 传入的Excel只有7个字段，如果大于7说明有其它为null的cell，则不处理
			Product product = new Product();
			for (int j = 0; j <= 6; j++) {
				switch (j) {
				case 0:
					product.setSupplier(row.getCell(0).toString());
					break;
				case 1:
					product.setProduct(row.getCell(1).toString());
					break;
				case 2:
					product.setManufacturer(row.getCell(2).toString());
					break;
				case 3:
					product.setLotnumber(row.getCell(3).toString());
					break;
				case 4:
					product.setEncapsulation(row.getCell(4).toString());
					break;
				case 5:
					product.setIsgoodsinstock(row.getCell(5).toString());
					break;
				case 6:
					product.setDescription(row.getCell(6).toString());
					break;
				default:
					break;
				}
				productList.add(product);

			}
		}
		return productList;
	}

	/*
	 * .xls转化为ArrayList
	 */
	public static ArrayList<Product> getListByExcelXLS(HSSFWorkbook hss) {
		ArrayList<Product> productList = new ArrayList<Product>();
		Sheet sheet = hss.getSheetAt(0);
		// row=0也就是第一行并非数据，而是属性名，所以不读取
		for (int i = 1; i <= sheet.getLastRowNum(); i++) {
			Row row = sheet.getRow(i);
			// 传入的Excel只有7个字段，如果大于7说明有其它为null的cell，则不处理
			Product product = new Product();
			for (int j = 0; j <= 6; j++) {
				switch (j) {
				case 0:
					product.setSupplier(row.getCell(0).toString());
					break;
				case 1:
					product.setProduct(row.getCell(1).toString());
					break;
				case 2:
					product.setManufacturer(row.getCell(2).toString());
					break;
				case 3:
					product.setLotnumber(row.getCell(3).toString());
					break;
				case 4:
					product.setEncapsulation(row.getCell(4).toString());
					break;
				case 5:
					product.setIsgoodsinstock(row.getCell(5).toString());
					break;
				case 6:
					product.setDescription(row.getCell(6).toString());
					break;
				default:
					break;
				}
				productList.add(product);
			}
		}
		return productList;
	}
}

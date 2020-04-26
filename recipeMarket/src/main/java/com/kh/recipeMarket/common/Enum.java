package com.kh.recipeMarket.common;

public class Enum {
	
	public Enum() {}
	
	public int boardNo(String bname) {
		
		switch(bname) {
		case "member": return 0;
		case "recipe": return 1;
		case "board": return 2;
		case "product": return 3;
		case "recipeReply": return 4;
		case "boardReply": return 5;
		case "productReply": return 6;
		}
		return 99;
	}

}

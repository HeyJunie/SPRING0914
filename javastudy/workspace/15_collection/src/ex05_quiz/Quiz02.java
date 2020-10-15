package ex05_quiz;

import java.util.HashSet;
import java.util.Set;

// 문제. 로또 발생기
// HashSet 클래스를 이용해서 당첨 번호 6개만 생성하시오.

public class Quiz02 {

	public static void main(String[] args) {
		
		// 랜덤 생성 -> HashSet 에 저장
		
		Set<Integer> set = new HashSet<Integer>();
		
		// 6번 생성 -> 6개가 아니면 다시 생성
		// 6개가 아니면 계속 생성
		while (set.size() != 6) {
			set.add( (int)(Math.random() * 45) + 1 );
		}
		
		System.out.println(set);
		
	}

}

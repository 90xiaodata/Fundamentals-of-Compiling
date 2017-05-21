package com.aspectj.demo.test;

import org.apache.commons.lang.time.StopWatch;

public aspect TopNwordAspect {

	int map_cnt = 0;
	int reduce_cnt = 0;
	
	StopWatch clock = new StopWatch();
	pointcut TopNwordPointCut() : execution(* main.java.samples.topn.TopN.main(..));
	
    before() : TopNwordPointCut(){  
    	clock.start(); //计时开始
    }
    after() : TopNwordPointCut(){  
    	clock.stop(); //计时结束
    	System.out.println(clock.getTime()+"ms");
    	System.out.println("The data set is divided into " + map_cnt + " <key,value> pair by mapper.");
    	System.out.println("The final result is produced by " + reduce_cnt + " reducer.");
    }
    
    pointcut MapPointCut() : execution(* main.java.samples.topn.TopN.TopNMapper.map(..));
    
    after() : MapPointCut(){  
    	map_cnt++;
    }
    
    pointcut ReducePointCut() : execution(* main.java.samples.topn.TopN.TopNReducer.reduce(..));
    
    after() : ReducePointCut(){  
    	reduce_cnt++;
    }
}

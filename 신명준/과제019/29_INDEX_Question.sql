--1) 어제 만든 SCORE_STGR 테이블의 SNO 컬럼에 INDEX를 추가하세요.
CREATE INDEX SNO_IDX 
          ON SCORE_STGR(SNO)

--2) 어제 만든 ST_COURSEPF 테이블의 SNO, CNO, PNO 다중 컬럼에 INDEX를 추가하세요.
CREATE INDEX S_C_P_NO 
          ON SCORE_STGR(SNO, CNO, PNO )
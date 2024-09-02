-- 1. 객체 제거(FK -> PK)
    -- 1-8. 상품 가격
    DROP TABLE price CASCADE CONSTRAINTS;
    -- 1-7. 상품옵셥
    DROP TABLE goods_option CASCADE CONSTRAINTS;
    -- 1-6. 상품사이즈&색상
    DROP TABLE goods_sizeColor CASCADE CONSTRAINTS;
    -- 1-5. 상품이미지
    DROP TABLE goods_image CASCADE CONSTRAINTS;
    -- 1-4. 상품
    DROP TABLE goods CASCADE CONSTRAINTS;
    -- 1-3. 색상(기본)
    DROP TABLE basic_color CASCADE CONSTRAINTS;
    -- 1-2. 사이즈(기본)
    DROP TABLE basic_size CASCADE CONSTRAINTS;
    -- 1-1. 카테고리
    DROP TABLE category CASCADE CONSTRAINTS;

    DROP SEQUENCE price_seq;
    DROP SEQUENCE goods_option_seq;
    DROP SEQUENCE goods_sizeColor_seq;
    DROP SEQUENCE goods_image_seq;
    DROP SEQUENCE goods_seq;
    DROP SEQUENCE color_seq;
    DROP SEQUENCE size_seq;

-- 2. 객체 생성 (PK -> FK : 판매가 되면 지우면 안된다.)
    -- << 테이블 >>
    -- 2-1. 카테고리
    CREATE TABLE category(
        cate_code1 NUMBER(3),
        cate_code2 NUMBER(3) DEFAULT 0,
        cate_name VARCHAR2(30) NOT NULL,
        CONSTRAINT category_pk PRIMARY KEY (cate_code1, cate_code2)
    );
    -- 2-2. 사이즈(기본)
    CREATE TABLE basic_size(
        size_no NUMBER PRIMARY KEY,
        cate_code1 NUMBER(3) NOT NULL,
        cate_code2 NUMBER(3) NOT NULL,
       size_name VARCHAR2(30) NOT NULL,
        CONSTRAINT basic_size_cate_fk FOREIGN KEY(cate_code1,cate_code2)
        REFERENCES category(cate_code1,cate_code2)

    );
    -- 2-3. 색상(기본)
     CREATE TABLE basic_color(
        color_no NUMBER PRIMARY KEY ,
        cate_code1 NUMBER(3) NOT NULL,
        cate_code2 NUMBER(3) NOT NULL,
        color_name VARCHAR2(30) NOT NULL,
        CONSTRAINT basic_color_cate_fk FOREIGN KEY(cate_code1,cate_code2)
        REFERENCES category(cate_code1,cate_code2)

    );
   -- 2-4. 상품
     CREATE TABLE goods(
        goods_no NUMBER PRIMARY KEY,
        cate_code1 NUMBER(3) NOT NULL,
        cate_code2 NUMBER(3) NOT NULL,
        goods_name VARCHAR2(300) NOT NULL,
        company VARCHAR2(60) NOT NULL,
        product_Date DATE NOT NULL,
        image_name VARCHAR2(200) NOT NULL,
        detail_image_name VARCHAR2(200),
        content VARCHAR2(2000),
        CONSTRAINT goods_cate_fk FOREIGN KEY(cate_code1,cate_code2)
        REFERENCES category(cate_code1,cate_code2)
    );
   -- 2-5. 상품이미지
    CREATE TABLE goods_image(
        image_no NUMBER PRIMARY KEY,
        goods_no NUMBER REFERENCES goods(goods_no) NOT NULL,
        image_name VARCHAR2(200) NOT NULL
    );
    -- 2-6. 상품사이즈&색상
    CREATE TABLE goods_sizeColor(
        goods_sizeColor_no NUMBER PRIMARY KEY,
        goods_no NUMBER REFERENCES goods(goods_no) NOT NULL,
        size_no NUMBER REFERENCES basic_size(size_no) NOT NULL,
        color_no NUMBER
    );
   -- 2-7. 상품옵셥
    CREATE TABLE goods_option(
        goods_option_no NUMBER PRIMARY KEY,
        goods_no NUMBER REFERENCES goods(goods_no) NOT NULL,
        option_name VARCHAR2(300) NOT NULL
    );
    -- 2-8. 상품 가격
    CREATE TABLE price(
        price_no NUMBER PRIMARY KEY,
        goods_no NUMBER REFERENCES goods(goods_no) NOT NULL,
        price NUMBER(10) NOT NULL,
        discount NUMBER(10) DEFAULT 0,
        discount_rate NUMBER(3) DEFAULT 0,
        delivery_charge NUMBER(5) DEFAULT 0,
        saved_rate NUMBER(3) DEFAULT 0,
        sale_startDate DATE DEFAULT sysdate,
        sale_endDate DATE DEFAULT '9999-12-31'
    );

    -- << 시퀀스 >>
    CREATE SEQUENCE price_seq;
    CREATE SEQUENCE goods_option_seq;
    CREATE SEQUENCE goods_sizeColor_seq;
    CREATE SEQUENCE goods_image_seq;
    CREATE SEQUENCE goods_seq;
    CREATE SEQUENCE color_seq;
    CREATE SEQUENCE size_seq;
    -- category의 시퀀스는 데이터가 얼마 안되고 작업이 많이 이루어지지 않는다. 그래서 max()를 사용해서 등록

-- 3. 샘플 데이터
    -- 3-1. 카테고리
    -- 대분류 카테고리
    INSERT INTO category(cate_code1, cate_name)
    VALUES((select NVL(max(cate_code1),0) + 1 from category), '의류');
    select NVL(max(cate_code1),0) + 1 from category;
    
    select * from category where cate_code1 = 1;
    INSERT INTO category(cate_code1, cate_code2, cate_name)
    VALUES(1, (select NVL(max(cate_code2),0) + 1 from category), '남성복상의');
    INSERT INTO category(cate_code1, cate_code2, cate_name)
    VALUES(1, (select NVL(max(cate_code2),0) + 1 from category), '남성복하의');
    INSERT INTO category(cate_code1, cate_code2, cate_name)
    VALUES(1, (select NVL(max(cate_code2),0) + 1 from category), '여성복상의');
    INSERT INTO category(cate_code1, cate_code2, cate_name)
    VALUES(1, (select NVL(max(cate_code2),0) + 1 from category), '여성복하의');
    
    commit;
    
    -- 대분류 가져오기
    select * from category where cate_code2 = 0;
    -- 중분류 가져오기
    select * from category where cate_code1 = 1 and cate_code2 != 0;
    
    -- 3-2. 기본 사이즈(대분류)
    INSERT INTO basic_size(size_no, cate_code1, cate_code2, size_name)
    VALUES(size_seq.nextval, 1, 0, 'S');
    INSERT INTO basic_size(size_no, cate_code1, cate_code2, size_name)
    VALUES(size_seq.nextval, 1, 0, 'M');
    INSERT INTO basic_size(size_no, cate_code1, cate_code2, size_name)
    VALUES(size_seq.nextval, 1, 0, 'L');
    INSERT INTO basic_size(size_no, cate_code1, cate_code2, size_name)
    VALUES(size_seq.nextval, 1, 0, 'XL');
    INSERT INTO basic_size(size_no, cate_code1, cate_code2, size_name)
    VALUES(size_seq.nextval, 1, 0, 'XXL');
    commit;
    select * from basic_size where cate_code1 = 1;
    -- 3-3. 기본 컬러
    INSERT INTO basic_color(color_no, cate_code1, cate_code2, color_name)
    VALUES(color_seq.nextval, 1, 0, 'RED');
    INSERT INTO basic_color(color_no, cate_code1, cate_code2, color_name)
    VALUES(color_seq.nextval, 1, 0, 'BLACK');
    INSERT INTO basic_color(color_no, cate_code1, cate_code2, color_name)
    VALUES(color_seq.nextval, 1, 0, 'BLUE');
    commit;
    select * from basic_color where cate_code1 = 1;
   -- 3-4. 상품
    -- 3-5. 상품이미지
    -- 3-6. 상품 사이즈컬러
    -- 3-7. 상품 옵션
    -- 3-8. 가격

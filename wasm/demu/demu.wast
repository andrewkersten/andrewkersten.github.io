(module
  (type (;0;) (func (param i32) (result i32)))
  (type (;1;) (func (param i32 i32 i32) (result i32)))
  (type (;2;) (func (param i32)))
  (type (;3;) (func (param i32 i32) (result i32)))
  (type (;4;) (func (result i32)))
  (type (;5;) (func (param i32 i32 i32)))
  (type (;6;) (func (param i32 i32)))
  (type (;7;) (func))
  (import "env" "memoryBase" (global (;0;) i32))
  (import "env" "_malloc" (func (;0;) (type 0)))
  (import "env" "_memcpy" (func (;1;) (type 1)))
  (import "env" "_free" (func (;2;) (type 2)))
  (import "env" "_calloc" (func (;3;) (type 3)))
  (import "env" "memory" (memory (;0;) 256))
  (import "env" "table" (table (;0;) 0 anyfunc))
  (import "env" "tableBase" (global (;1;) i32))
  (func (;4;) (type 4) (result i32)
    (local i32 i32)
    block i32  ;; label = @1
      i32.const 332
      call 0
      tee_local 0
      if  ;; label = @2
        get_local 0
        i32.const 65536
        i32.const 1
        call 3
        i32.store offset=328
        get_local 0
        call 20
        tee_local 1
        i32.store offset=40
        get_local 0
        i32.const 0
        i32.store offset=300
        get_local 0
        i32.const 0
        i32.store
        get_local 0
        i32.const 0
        i32.store offset=4
        get_local 0
        i32.const 0
        i32.store offset=8
        get_local 0
        i32.const 0
        i32.store offset=12
        get_local 1
        call 22
        get_local 0
        i32.const 0
        i32.store offset=16
        get_local 0
        i32.const 304
        i32.add
        tee_local 1
        i32.const 0
        i32.store
        get_local 1
        i32.const 0
        i32.store offset=4
        get_local 1
        i32.const 0
        i32.store offset=8
        get_local 1
        i32.const 0
        i32.store offset=12
        get_local 1
        i32.const 0
        i32.store16 offset=16
        get_local 0
        i32.const -1
        i32.store16 offset=322
        get_local 0
        i32.const 0
        i32.store16 offset=324
        get_local 0
        i32.const 0
        i32.store16 offset=326
      else
        i32.const 0
        set_local 0
      end
      get_local 0
    end)
  (func (;5;) (type 2) (param i32)
    (local i32)
    block  ;; label = @1
      get_local 0
      i32.const 0
      i32.store offset=8
      get_local 0
      i32.const 0
      i32.store offset=4
      get_local 0
      i32.const 0
      i32.store offset=12
      get_local 0
      i32.load offset=40
      call 22
      get_local 0
      i32.const 0
      i32.store offset=16
      get_local 0
      i32.const 304
      i32.add
      tee_local 1
      i32.const 0
      i32.store
      get_local 1
      i32.const 0
      i32.store offset=4
      get_local 1
      i32.const 0
      i32.store offset=8
      get_local 1
      i32.const 0
      i32.store offset=12
      get_local 1
      i32.const 0
      i32.store16 offset=16
      get_local 0
      i32.const -1
      i32.store16 offset=322
      get_local 0
      i32.const 0
      i32.store16 offset=324
      get_local 0
      i32.const 0
      i32.store16 offset=326
    end)
  (func (;6;) (type 2) (param i32)
    get_local 0
    if  ;; label = @1
      get_local 0
      i32.load offset=40
      call 21
      get_local 0
      i32.load offset=328
      call 2
      get_local 0
      call 2
    end)
  (func (;7;) (type 2) (param i32)
    (local i32)
    block  ;; label = @1
      get_local 0
      i32.const 0
      i32.store offset=8
      get_local 0
      i32.const 0
      i32.store offset=4
      get_local 0
      i32.const 0
      i32.store offset=12
      get_local 0
      i32.load offset=40
      call 22
      get_local 0
      i32.const 0
      i32.store offset=16
      get_local 0
      i32.const 304
      i32.add
      tee_local 1
      i32.const 0
      i32.store
      get_local 1
      i32.const 0
      i32.store offset=4
      get_local 1
      i32.const 0
      i32.store offset=8
      get_local 1
      i32.const 0
      i32.store offset=12
      get_local 1
      i32.const 0
      i32.store16 offset=16
      get_local 0
      i32.const -1
      i32.store16 offset=322
      get_local 0
      i32.const 0
      i32.store16 offset=324
      get_local 0
      i32.const 0
      i32.store16 offset=326
      get_local 0
      i32.const 1
      i32.store
    end)
  (func (;8;) (type 2) (param i32)
    get_local 0
    i32.const 0
    i32.store)
  (func (;9;) (type 5) (param i32 i32 i32)
    (local i32)
    get_local 0
    i32.load
    i32.const 1
    i32.eq
    if  ;; label = @1
      get_local 0
      i32.const 1
      i32.store offset=8
    else
      get_local 0
      i32.load offset=328
      get_local 1
      i32.const 65536
      get_local 2
      get_local 2
      i32.const 65536
      i32.gt_u
      tee_local 3
      select
      call 1
      drop
      get_local 3
      if  ;; label = @2
        get_local 0
        i32.const 1
        i32.store offset=8
      end
    end)
  (func (;10;) (type 3) (param i32 i32) (result i32)
    (local i32 i32)
    get_local 0
    i32.const 300
    i32.add
    tee_local 3
    i32.load
    tee_local 2
    i32.const 15
    i32.gt_u
    if i32  ;; label = @1
      i32.const 0
    else
      get_local 3
      get_local 2
      i32.const 1
      i32.add
      i32.store
      get_local 0
      i32.const 44
      i32.add
      get_local 2
      i32.const 4
      i32.shl
      i32.add
      tee_local 2
      get_local 1
      i32.load
      i32.store
      get_local 2
      get_local 1
      i32.load offset=4
      i32.store offset=4
      get_local 2
      get_local 1
      i32.load offset=8
      i32.store offset=8
      get_local 2
      get_local 1
      i32.load offset=12
      i32.store offset=12
      get_local 0
      i32.load
      i32.const 1
      i32.eq
      if i32  ;; label = @2
        get_local 0
        i32.const 1
        i32.store offset=8
        i32.const 1
      else
        i32.const 1
      end
    end
    tee_local 0)
  (func (;11;) (type 3) (param i32 i32) (result i32)
    get_local 1
    if i32  ;; label = @1
      get_local 0
      get_local 1
      i32.div_u
    else
      i32.const 0
    end)
  (func (;12;) (type 3) (param i32 i32) (result i32)
    get_local 1
    if i32  ;; label = @1
      get_local 0
      i32.const -2147483648
      i32.eq
      get_local 1
      i32.const -1
      i32.eq
      i32.and
      if i32  ;; label = @2
        i32.const 0
      else
        get_local 0
        get_local 1
        i32.div_s
      end
    else
      i32.const 0
    end)
  (func (;13;) (type 3) (param i32 i32) (result i32)
    get_local 1
    if i32  ;; label = @1
      get_local 0
      get_local 1
      i32.rem_s
    else
      i32.const 0
    end)
  (func (;14;) (type 2) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      get_local 0
      i32.load
      if  ;; label = @2
        get_local 0
        i32.const 8
        i32.add
        tee_local 21
        i32.load
        i32.const 1
        i32.ne
        if  ;; label = @3
          get_local 0
          i32.const 16
          i32.add
          set_local 4
          get_local 0
          i32.const 12
          i32.add
          set_local 12
          get_local 0
          i32.const 40
          i32.add
          set_local 14
          get_local 0
          i32.const 320
          i32.add
          set_local 6
          get_local 0
          i32.const 322
          i32.add
          set_local 7
          get_local 0
          i32.const 328
          i32.add
          set_local 11
          get_local 0
          i32.const 304
          i32.add
          set_local 15
          get_local 0
          i32.const 326
          i32.add
          set_local 16
          get_local 0
          i32.const 20
          i32.add
          set_local 9
          get_local 0
          i32.const 22
          i32.add
          set_local 17
          get_local 0
          i32.const 24
          i32.add
          set_local 10
          get_local 0
          i32.const 36
          i32.add
          set_local 18
          get_local 0
          i32.const 28
          i32.add
          set_local 2
          get_local 0
          i32.const 32
          i32.add
          set_local 3
          get_local 0
          i32.const 300
          i32.add
          set_local 22
          get_local 0
          i32.const 324
          i32.add
          set_local 5
          get_local 0
          i32.const 316
          i32.add
          set_local 13
          get_local 0
          i32.const 318
          i32.add
          set_local 20
          block  ;; label = @4
            block  ;; label = @5
              loop  ;; label = @6
                block  ;; label = @7
                  get_local 4
                  i32.load
                  set_local 1
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        loop  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    get_local 1
                                    br_table 2 (;@14;) 3 (;@13;) 0 (;@16;) 1 (;@15;) 4 (;@12;)
                                  end
                                  br 8 (;@7;)
                                end
                                br 9 (;@5;)
                              end
                              br 3 (;@10;)
                            end
                            br 3 (;@9;)
                          end
                          br 0 (;@11;)
                        end
                        unreachable
                      end
                      get_local 12
                      i32.load
                      i32.eqz
                      if  ;; label = @10
                        get_local 14
                        i32.load
                        call 25
                        i32.eqz
                        if  ;; label = @11
                          get_local 12
                          i32.const 1
                          i32.store
                          get_local 7
                          get_local 6
                          i32.load
                          tee_local 1
                          i32.const 16
                          i32.shr_u
                          i32.const -1
                          i32.add
                          i32.const 16
                          i32.shl
                          i32.const 16
                          i32.shr_s
                          tee_local 8
                          i32.store16
                          get_local 11
                          i32.load
                          tee_local 19
                          get_local 8
                          i32.const 65535
                          i32.and
                          i32.const 1
                          i32.shl
                          i32.add
                          get_local 1
                          i32.store16
                          get_local 15
                          i32.load16_s
                          set_local 1
                          get_local 7
                          get_local 7
                          i32.load16_s
                          i32.const -1
                          i32.add
                          i32.const 16
                          i32.shl
                          i32.const 16
                          i32.shr_s
                          tee_local 8
                          i32.store16
                          get_local 19
                          get_local 8
                          i32.const 65535
                          i32.and
                          i32.const 1
                          i32.shl
                          i32.add
                          get_local 1
                          i32.store16
                          get_local 6
                          get_local 16
                          i32.load16_s
                          i32.store16
                          get_local 15
                          get_local 14
                          i32.load
                          call 24
                          i32.store16
                        end
                      end
                      get_local 6
                      get_local 6
                      i32.load16_s
                      tee_local 1
                      i32.const 1
                      i32.add
                      i32.store16
                      get_local 9
                      get_local 11
                      i32.load
                      get_local 1
                      i32.const 65535
                      i32.and
                      i32.const 1
                      i32.shl
                      i32.add
                      i32.load16_u
                      tee_local 1
                      tee_local 8
                      i32.const 31
                      i32.and
                      tee_local 19
                      i32.store16
                      get_local 17
                      get_local 1
                      i32.const 65535
                      i32.and
                      i32.const 10
                      i32.shr_u
                      tee_local 1
                      i32.store16
                      get_local 10
                      get_local 8
                      i32.const 5
                      i32.shr_u
                      i32.const 31
                      i32.and
                      tee_local 8
                      i32.store16
                      get_local 18
                      get_global 0
                      i32.const 384
                      i32.add
                      get_local 19
                      i32.const 2
                      i32.shl
                      i32.add
                      get_global 0
                      i32.const 256
                      i32.add
                      get_local 8
                      i32.const 2
                      i32.shl
                      i32.add
                      get_local 1
                      select
                      i32.load
                      i32.store
                      get_local 2
                      get_local 0
                      get_local 1
                      i32.const 1
                      call 15
                      i32.store
                      get_global 0
                      get_local 17
                      i32.load16_u
                      i32.const 2
                      i32.shl
                      i32.add
                      i32.load
                      i32.const 0
                      i32.ne
                      set_local 1
                      get_local 9
                      i32.load16_s
                      if  ;; label = @10
                        get_local 4
                        i32.const 1
                        i32.store
                        br 2 (;@8;)
                      else
                        get_local 4
                        i32.const 2
                        i32.store
                        br 2 (;@8;)
                      end
                      unreachable
                    end
                    get_local 3
                    get_local 0
                    get_local 10
                    i32.load16_s
                    i32.const 0
                    call 15
                    i32.store
                    get_global 0
                    get_local 10
                    i32.load16_u
                    i32.const 2
                    i32.shl
                    i32.add
                    i32.load
                    set_local 1
                    get_local 4
                    i32.const 2
                    i32.store
                    get_local 1
                    i32.const 0
                    i32.ne
                    set_local 1
                  end
                  get_local 1
                  i32.eqz
                  br_if 1 (;@6;)
                  br 6 (;@1;)
                end
              end
              br 1 (;@4;)
            end
            get_local 6
            get_local 6
            i32.load16_s
            tee_local 1
            i32.const 1
            i32.add
            i32.store16
            get_local 9
            get_local 11
            i32.load
            get_local 1
            i32.const 65535
            i32.and
            i32.const 1
            i32.shl
            i32.add
            i32.load16_u
            tee_local 1
            tee_local 2
            i32.const 31
            i32.and
            i32.store16
            get_local 17
            get_local 1
            i32.const 65535
            i32.and
            i32.const 10
            i32.shr_u
            tee_local 1
            i32.store16
            get_local 10
            get_local 2
            i32.const 5
            i32.shr_u
            i32.const 31
            i32.and
            i32.store16
            get_local 0
            get_local 1
            i32.const 1
            call 15
            drop
            get_local 9
            i32.load16_s
            if  ;; label = @5
              get_local 0
              get_local 10
              i32.load16_s
              i32.const 0
              call 15
              drop
              get_local 9
              i32.load16_s
              i32.const 65528
              i32.and
              i32.const 16
              i32.eq
              br_if 4 (;@1;)
            end
            get_local 4
            i32.const 0
            i32.store
            br 3 (;@1;)
          end
          get_local 18
          i32.load
          tee_local 0
          i32.const 1
          i32.gt_u
          if  ;; label = @4
            get_local 18
            get_local 0
            i32.const -1
            i32.add
            i32.store
            br 3 (;@1;)
          end
          get_local 4
          i32.const 0
          i32.store
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      block  ;; label = @18
                                        block  ;; label = @19
                                          block  ;; label = @20
                                            block  ;; label = @21
                                              block  ;; label = @22
                                                block  ;; label = @23
                                                  block  ;; label = @24
                                                    block  ;; label = @25
                                                      get_local 9
                                                      i32.load16_s
                                                      br_table 0 (;@25;) 1 (;@24;) 2 (;@23;) 3 (;@22;) 4 (;@21;) 21 (;@4;) 5 (;@20;) 21 (;@4;) 6 (;@19;) 21 (;@4;) 7 (;@18;) 8 (;@17;) 9 (;@16;) 10 (;@15;) 21 (;@4;) 11 (;@14;) 12 (;@13;) 13 (;@12;) 14 (;@11;) 15 (;@10;) 16 (;@9;) 21 (;@4;) 17 (;@8;) 21 (;@4;) 21 (;@4;) 21 (;@4;) 18 (;@7;) 21 (;@4;) 21 (;@4;) 21 (;@4;) 19 (;@6;) 20 (;@5;) 21 (;@4;)
                                                    end
                                                    block  ;; label = @25
                                                      block  ;; label = @26
                                                        block  ;; label = @27
                                                          block  ;; label = @28
                                                            block  ;; label = @29
                                                              block  ;; label = @30
                                                                block  ;; label = @31
                                                                  block  ;; label = @32
                                                                    get_local 10
                                                                    i32.load16_s
                                                                    i32.const 1
                                                                    i32.sub
                                                                    br_table 0 (;@32;) 7 (;@25;) 7 (;@25;) 7 (;@25;) 7 (;@25;) 7 (;@25;) 7 (;@25;) 1 (;@31;) 2 (;@30;) 3 (;@29;) 4 (;@28;) 5 (;@27;) 7 (;@25;) 7 (;@25;) 7 (;@25;) 6 (;@26;) 7 (;@25;)
                                                                  end
                                                                  get_local 7
                                                                  get_local 6
                                                                  i32.load
                                                                  tee_local 0
                                                                  i32.const 16
                                                                  i32.shr_u
                                                                  tee_local 1
                                                                  i32.const -1
                                                                  i32.add
                                                                  i32.store16
                                                                  get_local 11
                                                                  i32.load
                                                                  get_local 1
                                                                  i32.const 1
                                                                  i32.shl
                                                                  i32.add
                                                                  get_local 0
                                                                  i32.store16
                                                                  get_local 6
                                                                  get_local 2
                                                                  i32.load
                                                                  i32.load16_s
                                                                  i32.store16
                                                                  br 30 (;@1;)
                                                                end
                                                                get_local 14
                                                                i32.load
                                                                get_local 2
                                                                i32.load
                                                                i32.load16_s
                                                                call 23
                                                                br_if 29 (;@1;)
                                                                get_local 21
                                                                i32.const 1
                                                                i32.store
                                                                br 29 (;@1;)
                                                              end
                                                              get_local 2
                                                              i32.load
                                                              get_local 16
                                                              i32.load16_s
                                                              i32.store16
                                                              br 28 (;@1;)
                                                            end
                                                            get_local 16
                                                            get_local 2
                                                            i32.load
                                                            i32.load16_s
                                                            i32.store16
                                                            br 27 (;@1;)
                                                          end
                                                          get_local 12
                                                          i32.const 0
                                                          i32.store
                                                          get_local 7
                                                          get_local 7
                                                          i32.load16_s
                                                          tee_local 0
                                                          i32.const 1
                                                          i32.add
                                                          i32.const 16
                                                          i32.shl
                                                          i32.const 16
                                                          i32.shr_s
                                                          tee_local 1
                                                          i32.store16
                                                          get_local 15
                                                          get_local 11
                                                          i32.load
                                                          tee_local 2
                                                          get_local 0
                                                          i32.const 65535
                                                          i32.and
                                                          i32.const 1
                                                          i32.shl
                                                          i32.add
                                                          i32.load16_s
                                                          i32.store16
                                                          get_local 7
                                                          get_local 0
                                                          i32.const 2
                                                          i32.add
                                                          i32.store16
                                                          get_local 6
                                                          get_local 2
                                                          get_local 1
                                                          i32.const 65535
                                                          i32.and
                                                          i32.const 1
                                                          i32.shl
                                                          i32.add
                                                          i32.load16_s
                                                          i32.store16
                                                          br 26 (;@1;)
                                                        end
                                                        get_local 12
                                                        get_local 2
                                                        i32.load
                                                        i32.load16_s
                                                        i32.eqz
                                                        i32.store
                                                        br 25 (;@1;)
                                                      end
                                                      get_local 2
                                                      i32.load
                                                      get_local 22
                                                      i32.load
                                                      i32.store16
                                                      br 24 (;@1;)
                                                    end
                                                    br 23 (;@1;)
                                                  end
                                                  get_local 3
                                                  i32.load
                                                  get_local 2
                                                  i32.load
                                                  i32.load16_s
                                                  i32.store16
                                                  br 22 (;@1;)
                                                end
                                                get_local 2
                                                i32.load
                                                tee_local 1
                                                i32.load16_u
                                                get_local 3
                                                i32.load
                                                tee_local 0
                                                i32.load16_u
                                                i32.const 65535
                                                i32.xor
                                                i32.gt_u
                                                if  ;; label = @23
                                                  get_local 5
                                                  i32.const 1
                                                  i32.store16
                                                end
                                                get_local 5
                                                i32.const 0
                                                i32.store16
                                                get_local 0
                                                get_local 0
                                                i32.load16_u
                                                get_local 1
                                                i32.load16_u
                                                i32.add
                                                i32.store16
                                                br 21 (;@1;)
                                              end
                                              get_local 2
                                              i32.load
                                              tee_local 1
                                              i32.load16_u
                                              get_local 3
                                              i32.load
                                              tee_local 0
                                              i32.load16_u
                                              i32.gt_s
                                              if  ;; label = @22
                                                get_local 5
                                                i32.const -1
                                                i32.store16
                                              end
                                              get_local 5
                                              i32.const 0
                                              i32.store16
                                              get_local 0
                                              get_local 0
                                              i32.load16_u
                                              get_local 1
                                              i32.load16_u
                                              i32.sub
                                              i32.store16
                                              br 20 (;@1;)
                                            end
                                            get_local 5
                                            get_local 2
                                            i32.load
                                            tee_local 1
                                            i32.load16_u
                                            get_local 3
                                            i32.load
                                            tee_local 0
                                            i32.load16_u
                                            i32.mul
                                            i32.const 16
                                            i32.shr_u
                                            i32.store16
                                            get_local 0
                                            get_local 0
                                            i32.load16_u
                                            get_local 1
                                            i32.load16_u
                                            i32.mul
                                            i32.store16
                                            br 19 (;@1;)
                                          end
                                          get_local 2
                                          i32.load
                                          tee_local 1
                                          i32.load16_s
                                          tee_local 2
                                          if  ;; label = @20
                                            get_local 5
                                            get_local 3
                                            i32.load
                                            tee_local 0
                                            i32.load16_u
                                            i32.const 16
                                            i32.shl
                                            get_local 2
                                            i32.const 65535
                                            i32.and
                                            call 11
                                            i32.store16
                                            get_local 0
                                            get_local 0
                                            i32.load16_u
                                            get_local 1
                                            i32.load16_u
                                            call 12
                                            i32.store16
                                            br 19 (;@1;)
                                          else
                                            get_local 5
                                            i32.const 0
                                            i32.store16
                                            get_local 3
                                            i32.load
                                            i32.const 0
                                            i32.store16
                                            br 19 (;@1;)
                                          end
                                          unreachable
                                        end
                                        get_local 3
                                        i32.load
                                        set_local 0
                                        get_local 2
                                        i32.load
                                        i32.load16_s
                                        tee_local 1
                                        if  ;; label = @19
                                          get_local 0
                                          get_local 0
                                          i32.load16_u
                                          get_local 1
                                          i32.const 65535
                                          i32.and
                                          call 13
                                          i32.store16
                                          br 18 (;@1;)
                                        else
                                          get_local 0
                                          i32.const 0
                                          i32.store16
                                          br 18 (;@1;)
                                        end
                                        unreachable
                                      end
                                      get_local 3
                                      i32.load
                                      tee_local 0
                                      get_local 0
                                      i32.load16_s
                                      get_local 2
                                      i32.load
                                      i32.load16_s
                                      i32.and
                                      i32.store16
                                      br 16 (;@1;)
                                    end
                                    get_local 3
                                    i32.load
                                    tee_local 0
                                    get_local 0
                                    i32.load16_s
                                    get_local 2
                                    i32.load
                                    i32.load16_s
                                    i32.or
                                    i32.store16
                                    br 15 (;@1;)
                                  end
                                  get_local 3
                                  i32.load
                                  tee_local 0
                                  get_local 0
                                  i32.load16_s
                                  get_local 2
                                  i32.load
                                  i32.load16_s
                                  i32.xor
                                  i32.store16
                                  br 14 (;@1;)
                                end
                                get_local 5
                                get_local 3
                                i32.load
                                tee_local 0
                                i32.load16_u
                                i32.const 16
                                i32.shl
                                get_local 2
                                i32.load
                                tee_local 1
                                i32.load16_u
                                i32.shr_u
                                i32.store16
                                get_local 0
                                get_local 0
                                i32.load16_u
                                get_local 1
                                i32.load16_u
                                i32.shr_u
                                i32.store16
                                br 13 (;@1;)
                              end
                              get_local 5
                              get_local 3
                              i32.load
                              tee_local 0
                              i32.load16_u
                              get_local 2
                              i32.load
                              tee_local 1
                              i32.load16_u
                              i32.shl
                              i32.const 16
                              i32.shr_u
                              i32.store16
                              get_local 0
                              get_local 0
                              i32.load16_u
                              get_local 1
                              i32.load16_u
                              i32.shl
                              i32.store16
                              br 12 (;@1;)
                            end
                            get_local 2
                            i32.load
                            i32.load16_s
                            get_local 3
                            i32.load
                            i32.load16_s
                            i32.and
                            i32.const 65535
                            i32.and
                            br_if 11 (;@1;)
                            get_local 4
                            i32.const 3
                            i32.store
                            br 11 (;@1;)
                          end
                          get_local 2
                          i32.load
                          i32.load16_s
                          get_local 3
                          i32.load
                          i32.load16_s
                          i32.and
                          i32.const 65535
                          i32.and
                          i32.eqz
                          br_if 10 (;@1;)
                          get_local 4
                          i32.const 3
                          i32.store
                          br 10 (;@1;)
                        end
                        get_local 2
                        i32.load
                        i32.load16_s
                        get_local 3
                        i32.load
                        i32.load16_s
                        i32.eq
                        br_if 9 (;@1;)
                        get_local 4
                        i32.const 3
                        i32.store
                        br 9 (;@1;)
                      end
                      get_local 2
                      i32.load
                      i32.load16_s
                      get_local 3
                      i32.load
                      i32.load16_s
                      i32.ne
                      br_if 8 (;@1;)
                      get_local 4
                      i32.const 3
                      i32.store
                      br 8 (;@1;)
                    end
                    get_local 2
                    i32.load
                    i32.load16_u
                    get_local 3
                    i32.load
                    i32.load16_u
                    i32.gt_s
                    br_if 7 (;@1;)
                    get_local 4
                    i32.const 3
                    i32.store
                    br 7 (;@1;)
                  end
                  get_local 2
                  i32.load
                  i32.load16_u
                  get_local 3
                  i32.load
                  i32.load16_u
                  i32.lt_s
                  br_if 6 (;@1;)
                  get_local 4
                  i32.const 3
                  i32.store
                  br 6 (;@1;)
                end
                get_local 5
                get_local 2
                i32.load
                tee_local 2
                i32.load16_u
                tee_local 0
                get_local 3
                i32.load
                tee_local 1
                i32.load16_u
                tee_local 3
                i32.const 65535
                i32.xor
                i32.gt_u
                if i32  ;; label = @7
                  i32.const 1
                else
                  get_local 3
                  get_local 0
                  i32.add
                  i32.const 65535
                  i32.and
                  get_local 5
                  i32.load16_u
                  i32.const 65535
                  i32.xor
                  i32.gt_u
                end
                tee_local 0
                i32.store16
                get_local 1
                get_local 0
                i32.const 65535
                i32.and
                get_local 2
                i32.load16_u
                i32.add
                get_local 1
                i32.load16_u
                i32.add
                i32.store16
                br 5 (;@1;)
              end
              get_local 3
              i32.load
              get_local 2
              i32.load
              i32.load16_s
              i32.store16
              get_local 13
              get_local 13
              i32.load
              tee_local 0
              i32.const 65535
              i32.and
              i32.const 1
              i32.add
              i32.store16
              get_local 20
              get_local 0
              i32.const 16
              i32.shr_u
              i32.const 1
              i32.add
              i32.store16
              br 4 (;@1;)
            end
            get_local 3
            i32.load
            get_local 2
            i32.load
            i32.load16_s
            i32.store16
            get_local 13
            get_local 13
            i32.load
            tee_local 0
            i32.const 65535
            i32.and
            i32.const -1
            i32.add
            i32.store16
            get_local 20
            get_local 0
            i32.const 16
            i32.shr_u
            i32.const -1
            i32.add
            i32.store16
          end
        end
      end
    end)
  (func (;15;) (type 1) (param i32 i32 i32) (result i32)
    (local i32)
    block i32  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      block  ;; label = @18
                                        block  ;; label = @19
                                          block  ;; label = @20
                                            block  ;; label = @21
                                              block  ;; label = @22
                                                block  ;; label = @23
                                                  block  ;; label = @24
                                                    block  ;; label = @25
                                                      block  ;; label = @26
                                                        block  ;; label = @27
                                                          block  ;; label = @28
                                                            block  ;; label = @29
                                                              block  ;; label = @30
                                                                block  ;; label = @31
                                                                  block  ;; label = @32
                                                                    block  ;; label = @33
                                                                      block  ;; label = @34
                                                                        get_local 1
                                                                        i32.const 16
                                                                        i32.shl
                                                                        i32.const 16
                                                                        i32.shr_s
                                                                        br_table 0 (;@34;) 1 (;@33;) 2 (;@32;) 3 (;@31;) 4 (;@30;) 5 (;@29;) 6 (;@28;) 7 (;@27;) 8 (;@26;) 9 (;@25;) 10 (;@24;) 11 (;@23;) 12 (;@22;) 13 (;@21;) 14 (;@20;) 15 (;@19;) 16 (;@18;) 17 (;@17;) 18 (;@16;) 19 (;@15;) 20 (;@14;) 21 (;@13;) 22 (;@12;) 23 (;@11;) 24 (;@10;) 25 (;@9;) 26 (;@8;) 27 (;@7;) 28 (;@6;) 29 (;@5;) 30 (;@4;) 31 (;@3;) 32 (;@2;)
                                                                      end
                                                                      get_local 0
                                                                      i32.const 304
                                                                      i32.add
                                                                      br 32 (;@1;)
                                                                    end
                                                                    get_local 0
                                                                    i32.const 306
                                                                    i32.add
                                                                    br 31 (;@1;)
                                                                  end
                                                                  get_local 0
                                                                  i32.const 308
                                                                  i32.add
                                                                  br 30 (;@1;)
                                                                end
                                                                get_local 0
                                                                i32.const 310
                                                                i32.add
                                                                br 29 (;@1;)
                                                              end
                                                              get_local 0
                                                              i32.const 312
                                                              i32.add
                                                              br 28 (;@1;)
                                                            end
                                                            get_local 0
                                                            i32.const 314
                                                            i32.add
                                                            br 27 (;@1;)
                                                          end
                                                          get_local 0
                                                          i32.const 316
                                                          i32.add
                                                          br 26 (;@1;)
                                                        end
                                                        get_local 0
                                                        i32.const 318
                                                        i32.add
                                                        br 25 (;@1;)
                                                      end
                                                      get_local 0
                                                      i32.load offset=328
                                                      get_local 0
                                                      i32.load16_u offset=304
                                                      i32.const 1
                                                      i32.shl
                                                      i32.add
                                                      br 24 (;@1;)
                                                    end
                                                    get_local 0
                                                    i32.load offset=328
                                                    get_local 0
                                                    i32.load16_u offset=306
                                                    i32.const 1
                                                    i32.shl
                                                    i32.add
                                                    br 23 (;@1;)
                                                  end
                                                  get_local 0
                                                  i32.load offset=328
                                                  get_local 0
                                                  i32.load16_u offset=308
                                                  i32.const 1
                                                  i32.shl
                                                  i32.add
                                                  br 22 (;@1;)
                                                end
                                                get_local 0
                                                i32.load offset=328
                                                get_local 0
                                                i32.load16_u offset=310
                                                i32.const 1
                                                i32.shl
                                                i32.add
                                                br 21 (;@1;)
                                              end
                                              get_local 0
                                              i32.load offset=328
                                              get_local 0
                                              i32.load16_u offset=312
                                              i32.const 1
                                              i32.shl
                                              i32.add
                                              br 20 (;@1;)
                                            end
                                            get_local 0
                                            i32.load offset=328
                                            get_local 0
                                            i32.load16_u offset=314
                                            i32.const 1
                                            i32.shl
                                            i32.add
                                            br 19 (;@1;)
                                          end
                                          get_local 0
                                          i32.load offset=328
                                          get_local 0
                                          i32.load16_u offset=316
                                          i32.const 1
                                          i32.shl
                                          i32.add
                                          br 18 (;@1;)
                                        end
                                        get_local 0
                                        i32.load offset=328
                                        get_local 0
                                        i32.load16_u offset=318
                                        i32.const 1
                                        i32.shl
                                        i32.add
                                        br 17 (;@1;)
                                      end
                                      get_local 0
                                      i32.load16_u offset=304
                                      set_local 2
                                      get_local 0
                                      i32.const 320
                                      i32.add
                                      tee_local 3
                                      i32.load16_s
                                      set_local 1
                                      get_local 3
                                      get_local 1
                                      i32.const 1
                                      i32.add
                                      i32.store16
                                      get_local 0
                                      i32.load offset=328
                                      tee_local 0
                                      get_local 0
                                      get_local 1
                                      i32.const 65535
                                      i32.and
                                      i32.const 1
                                      i32.shl
                                      i32.add
                                      i32.load16_u
                                      get_local 2
                                      i32.add
                                      i32.const 1
                                      i32.shl
                                      i32.add
                                      br 16 (;@1;)
                                    end
                                    get_local 0
                                    i32.load16_u offset=306
                                    set_local 2
                                    get_local 0
                                    i32.const 320
                                    i32.add
                                    tee_local 3
                                    i32.load16_s
                                    set_local 1
                                    get_local 3
                                    get_local 1
                                    i32.const 1
                                    i32.add
                                    i32.store16
                                    get_local 0
                                    i32.load offset=328
                                    tee_local 0
                                    get_local 0
                                    get_local 1
                                    i32.const 65535
                                    i32.and
                                    i32.const 1
                                    i32.shl
                                    i32.add
                                    i32.load16_u
                                    get_local 2
                                    i32.add
                                    i32.const 1
                                    i32.shl
                                    i32.add
                                    br 15 (;@1;)
                                  end
                                  get_local 0
                                  i32.load16_u offset=308
                                  set_local 2
                                  get_local 0
                                  i32.const 320
                                  i32.add
                                  tee_local 3
                                  i32.load16_s
                                  set_local 1
                                  get_local 3
                                  get_local 1
                                  i32.const 1
                                  i32.add
                                  i32.store16
                                  get_local 0
                                  i32.load offset=328
                                  tee_local 0
                                  get_local 0
                                  get_local 1
                                  i32.const 65535
                                  i32.and
                                  i32.const 1
                                  i32.shl
                                  i32.add
                                  i32.load16_u
                                  get_local 2
                                  i32.add
                                  i32.const 1
                                  i32.shl
                                  i32.add
                                  br 14 (;@1;)
                                end
                                get_local 0
                                i32.load16_u offset=310
                                set_local 2
                                get_local 0
                                i32.const 320
                                i32.add
                                tee_local 3
                                i32.load16_s
                                set_local 1
                                get_local 3
                                get_local 1
                                i32.const 1
                                i32.add
                                i32.store16
                                get_local 0
                                i32.load offset=328
                                tee_local 0
                                get_local 0
                                get_local 1
                                i32.const 65535
                                i32.and
                                i32.const 1
                                i32.shl
                                i32.add
                                i32.load16_u
                                get_local 2
                                i32.add
                                i32.const 1
                                i32.shl
                                i32.add
                                br 13 (;@1;)
                              end
                              get_local 0
                              i32.load16_u offset=312
                              set_local 2
                              get_local 0
                              i32.const 320
                              i32.add
                              tee_local 3
                              i32.load16_s
                              set_local 1
                              get_local 3
                              get_local 1
                              i32.const 1
                              i32.add
                              i32.store16
                              get_local 0
                              i32.load offset=328
                              tee_local 0
                              get_local 0
                              get_local 1
                              i32.const 65535
                              i32.and
                              i32.const 1
                              i32.shl
                              i32.add
                              i32.load16_u
                              get_local 2
                              i32.add
                              i32.const 1
                              i32.shl
                              i32.add
                              br 12 (;@1;)
                            end
                            get_local 0
                            i32.load16_u offset=314
                            set_local 2
                            get_local 0
                            i32.const 320
                            i32.add
                            tee_local 3
                            i32.load16_s
                            set_local 1
                            get_local 3
                            get_local 1
                            i32.const 1
                            i32.add
                            i32.store16
                            get_local 0
                            i32.load offset=328
                            tee_local 0
                            get_local 0
                            get_local 1
                            i32.const 65535
                            i32.and
                            i32.const 1
                            i32.shl
                            i32.add
                            i32.load16_u
                            get_local 2
                            i32.add
                            i32.const 1
                            i32.shl
                            i32.add
                            br 11 (;@1;)
                          end
                          get_local 0
                          i32.load16_u offset=316
                          set_local 2
                          get_local 0
                          i32.const 320
                          i32.add
                          tee_local 3
                          i32.load16_s
                          set_local 1
                          get_local 3
                          get_local 1
                          i32.const 1
                          i32.add
                          i32.store16
                          get_local 0
                          i32.load offset=328
                          tee_local 0
                          get_local 0
                          get_local 1
                          i32.const 65535
                          i32.and
                          i32.const 1
                          i32.shl
                          i32.add
                          i32.load16_u
                          get_local 2
                          i32.add
                          i32.const 1
                          i32.shl
                          i32.add
                          br 10 (;@1;)
                        end
                        get_local 0
                        i32.load16_u offset=318
                        set_local 2
                        get_local 0
                        i32.const 320
                        i32.add
                        tee_local 3
                        i32.load16_s
                        set_local 1
                        get_local 3
                        get_local 1
                        i32.const 1
                        i32.add
                        i32.store16
                        get_local 0
                        i32.load offset=328
                        tee_local 0
                        get_local 0
                        get_local 1
                        i32.const 65535
                        i32.and
                        i32.const 1
                        i32.shl
                        i32.add
                        i32.load16_u
                        get_local 2
                        i32.add
                        i32.const 1
                        i32.shl
                        i32.add
                        br 9 (;@1;)
                      end
                      get_local 0
                      i32.const 322
                      i32.add
                      tee_local 3
                      i32.load16_s
                      set_local 1
                      get_local 0
                      i32.load offset=328
                      set_local 0
                      get_local 2
                      if  ;; label = @10
                        get_local 3
                        get_local 1
                        i32.const 1
                        i32.add
                        i32.const 16
                        i32.shl
                        i32.const 16
                        i32.shr_s
                        tee_local 1
                        i32.store16
                        get_local 0
                        get_local 1
                        i32.const 65535
                        i32.and
                        i32.const 1
                        i32.shl
                        i32.add
                        br 9 (;@1;)
                      else
                        get_local 3
                        get_local 1
                        i32.const -1
                        i32.add
                        i32.store16
                        get_local 0
                        get_local 1
                        i32.const 65535
                        i32.and
                        i32.const 1
                        i32.shl
                        i32.add
                        br 9 (;@1;)
                      end
                      unreachable
                    end
                    get_local 0
                    i32.load offset=328
                    get_local 0
                    i32.load16_u offset=322
                    i32.const 1
                    i32.shl
                    i32.add
                    br 7 (;@1;)
                  end
                  get_local 0
                  i32.load16_u offset=322
                  set_local 2
                  get_local 0
                  i32.const 320
                  i32.add
                  tee_local 3
                  i32.load16_s
                  set_local 1
                  get_local 3
                  get_local 1
                  i32.const 1
                  i32.add
                  i32.store16
                  get_local 0
                  i32.load offset=328
                  tee_local 0
                  get_local 0
                  get_local 1
                  i32.const 65535
                  i32.and
                  i32.const 1
                  i32.shl
                  i32.add
                  i32.load16_u
                  get_local 2
                  i32.add
                  i32.const 1
                  i32.shl
                  i32.add
                  br 6 (;@1;)
                end
                get_local 0
                i32.const 322
                i32.add
                br 5 (;@1;)
              end
              get_local 0
              i32.const 320
              i32.add
              br 4 (;@1;)
            end
            get_local 0
            i32.const 324
            i32.add
            br 3 (;@1;)
          end
          get_local 0
          i32.const 320
          i32.add
          tee_local 2
          i32.load16_s
          set_local 1
          get_local 2
          get_local 1
          i32.const 1
          i32.add
          i32.store16
          get_local 0
          i32.load offset=328
          tee_local 0
          get_local 0
          get_local 1
          i32.const 65535
          i32.and
          i32.const 1
          i32.shl
          i32.add
          i32.load16_u
          i32.const 1
          i32.shl
          i32.add
          br 2 (;@1;)
        end
        get_local 0
        i32.const 320
        i32.add
        tee_local 2
        i32.load16_s
        set_local 1
        get_local 2
        get_local 1
        i32.const 1
        i32.add
        i32.store16
        get_local 0
        i32.load offset=328
        get_local 1
        i32.const 65535
        i32.and
        i32.const 1
        i32.shl
        i32.add
        br 1 (;@1;)
      end
      i32.const 0
    end
    tee_local 0)
  (func (;16;) (type 6) (param i32 i32)
    get_local 0
    i32.load offset=40
    get_local 1
    call 23
    i32.eqz
    if  ;; label = @1
      get_local 0
      i32.const 1
      i32.store offset=8
    end)
  (func (;17;) (type 6) (param i32 i32)
    (local i32)
    get_local 1
    if  ;; label = @1
      i32.const 0
      set_local 2
      loop  ;; label = @2
        get_local 0
        call 14
        get_local 2
        i32.const 1
        i32.add
        tee_local 2
        get_local 1
        i32.ne
        br_if 0 (;@2;)
      end
    end)
  (func (;18;) (type 5) (param i32 i32 i32)
    get_local 0
    i32.const 304
    i32.add
    get_local 1
    i32.const 1
    i32.shl
    i32.add
    get_local 2
    i32.store16)
  (func (;19;) (type 3) (param i32 i32) (result i32)
    get_local 0
    i32.const 304
    i32.add
    get_local 1
    i32.const 1
    i32.shl
    i32.add
    i32.load16_s)
  (func (;20;) (type 4) (result i32)
    (local i32)
    block i32  ;; label = @1
      i32.const 1
      i32.const 524
      call 3
      tee_local 0
      if  ;; label = @2
        get_local 0
        i32.const 1
        i32.store offset=4
      else
        i32.const 0
        set_local 0
      end
      get_local 0
    end)
  (func (;21;) (type 2) (param i32)
    get_local 0
    call 2)
  (func (;22;) (type 2) (param i32)
    block  ;; label = @1
      get_local 0
      i32.const 1
      i32.store offset=4
      get_local 0
      i32.const 0
      i32.store offset=8
      get_local 0
      i32.const 0
      i32.store
    end)
  (func (;23;) (type 3) (param i32 i32) (result i32)
    (local i32 i32)
    get_local 0
    i32.load
    i32.const 255
    i32.gt_u
    if i32  ;; label = @1
      i32.const 0
    else
      i32.const 0
      get_local 0
      i32.const 8
      i32.add
      tee_local 3
      i32.load
      i32.const 1
      i32.add
      tee_local 2
      get_local 2
      i32.const 255
      i32.gt_u
      select
      set_local 2
      get_local 3
      get_local 2
      i32.store
      get_local 0
      i32.const 12
      i32.add
      get_local 2
      i32.const 1
      i32.shl
      i32.add
      get_local 1
      i32.store16
      get_local 0
      get_local 0
      i32.load
      i32.const 1
      i32.add
      i32.store
      i32.const 1
    end
    tee_local 0)
  (func (;24;) (type 0) (param i32) (result i32)
    (local i32 i32 i32)
    block i32  ;; label = @1
      get_local 0
      i32.const 12
      i32.add
      get_local 0
      i32.const 4
      i32.add
      tee_local 1
      i32.load
      tee_local 2
      i32.const 1
      i32.shl
      i32.add
      i32.load16_s
      set_local 3
      get_local 0
      get_local 0
      i32.load
      i32.const -1
      i32.add
      i32.store
      get_local 1
      i32.const 0
      get_local 2
      i32.const 1
      i32.add
      tee_local 0
      get_local 0
      i32.const 255
      i32.gt_u
      select
      i32.store
      get_local 3
    end)
  (func (;25;) (type 0) (param i32) (result i32)
    get_local 0
    i32.load
    i32.eqz)
  (func (;26;) (type 7)
    nop)
  (func (;27;) (type 7)
    block  ;; label = @1
      get_global 0
      i32.const 512
      i32.add
      set_global 2
      get_global 2
      i32.const 5242880
      i32.add
      set_global 3
      call 26
    end)
  (global (;2;) (mut i32) (i32.const 0))
  (global (;3;) (mut i32) (i32.const 0))
  (export "_dcpu_set_register" (func 18))
  (export "__post_instantiate" (func 27))
  (export "_dcpu_process" (func 17))
  (export "_interrupt_queue_empty" (func 25))
  (export "_dcpu_power_off" (func 8))
  (export "_dcpu_attach" (func 10))
  (export "_dcpu_interrupt" (func 16))
  (export "_interrupt_queue_reset" (func 22))
  (export "_interrupt_queue_destroy" (func 21))
  (export "_dcpu_flash" (func 9))
  (export "runPostSets" (func 26))
  (export "_interrupt_queue_pop" (func 24))
  (export "_dcpu_reset" (func 5))
  (export "_dcpu_get_register" (func 19))
  (export "_dcpu_create" (func 4))
  (export "_dcpu_cycle" (func 14))
  (export "_dcpu_destroy" (func 6))
  (export "_dcpu_power_on" (func 7))
  (export "_interrupt_queue_create" (func 20))
  (export "_interrupt_queue_push" (func 23))
  (data (get_global 0) "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\03\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\04\00\00\00\01\00\00\00\01\00\00\00\03\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\04\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\02\00\00\00\02\00\00\00\02\00\00\00\02\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\02\00\00\00\02\00\00\00\02\00\00\00\02\00\00\00\02\00\00\00\02\00\00\00\02\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\03\00\00\00\03\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\02"))

(module
  (type (;0;) (func (param i32 i32)))
  (type (;1;) (func (param i32)))
  (type (;2;) (func (param i32) (result i32)))
  (type (;3;) (func (param i32 i32 i32) (result i32)))
  (type (;4;) (func (param i32 i32) (result i32)))
  (type (;5;) (func (result i32)))
  (type (;6;) (func (param i32 i32 i32)))
  (type (;7;) (func))
  (type (;8;) (func (result f64)))
  (import "env" "memoryBase" (global (;0;) i32))
  (import "env" "tableBase" (global (;1;) i32))
  (import "env" "abort" (func (;0;) (type 1)))
  (import "env" "_malloc" (func (;1;) (type 2)))
  (import "env" "_memcpy" (func (;2;) (type 3)))
  (import "env" "_free" (func (;3;) (type 1)))
  (import "env" "_memset" (func (;4;) (type 3)))
  (import "env" "_calloc" (func (;5;) (type 4)))
  (import "env" "memory" (memory (;0;) 256))
  (import "env" "table" (table (;0;) 8 anyfunc))
  (func (;6;) (type 5) (result i32)
    (local i32 i32 i32 i32)
    block i32  ;; label = @1
      get_global 2
      set_local 1
      get_global 2
      i32.const 16
      i32.add
      set_global 2
      get_local 1
      i32.const 4
      i32.add
      set_local 2
      get_local 1
      tee_local 0
      i32.const 396
      call 1
      i32.store
      get_local 0
      i32.load
      if i32  ;; label = @2
        i32.const 131072
        i32.const 1
        call 5
        set_local 3
        get_local 0
        i32.load
        get_local 3
        i32.store offset=392
        call 23
        set_local 3
        get_local 0
        i32.load
        get_local 3
        i32.store offset=40
        get_local 0
        i32.load
        i32.const 0
        i32.store
        get_local 0
        i32.load
        i32.const 0
        i32.store offset=364
        get_local 0
        i32.load
        call 7
        get_local 2
        get_local 0
        i32.load
        i32.store
        get_local 1
        set_global 2
        get_local 2
        i32.load
      else
        get_local 2
        i32.const 0
        i32.store
        get_local 1
        set_global 2
        get_local 2
        i32.load
      end
    end)
  (func (;7;) (type 1) (param i32)
    (local i32 i32)
    block  ;; label = @1
      get_global 2
      set_local 2
      get_global 2
      i32.const 16
      i32.add
      set_global 2
      get_local 2
      tee_local 1
      get_local 0
      i32.store
      get_local 1
      i32.load
      i32.eqz
      if  ;; label = @2
        get_local 2
        set_global 2
        return
      end
      get_local 1
      i32.load
      i32.const 0
      i32.store offset=8
      get_local 1
      i32.load
      i32.const 0
      i32.store offset=4
      get_local 1
      i32.load
      i32.const 0
      i32.store offset=12
      get_local 1
      i32.load
      i32.load offset=40
      call 25
      get_local 1
      i32.load
      i32.const 0
      i32.store offset=16
      get_local 1
      i32.load
      i32.const 0
      i32.store16 offset=368
      get_local 1
      i32.load
      i32.const 0
      i32.store16 offset=370
      get_local 1
      i32.load
      i32.const 0
      i32.store16 offset=372
      get_local 1
      i32.load
      i32.const 0
      i32.store16 offset=374
      get_local 1
      i32.load
      i32.const 0
      i32.store16 offset=376
      get_local 1
      i32.load
      i32.const 0
      i32.store16 offset=378
      get_local 1
      i32.load
      i32.const 0
      i32.store16 offset=380
      get_local 1
      i32.load
      i32.const 0
      i32.store16 offset=382
      get_local 1
      i32.load
      i32.const 0
      i32.store16 offset=384
      get_local 1
      i32.load
      i32.const -1
      i32.store16 offset=386
      get_local 1
      i32.load
      i32.const 0
      i32.store16 offset=388
      get_local 1
      i32.load
      i32.const 0
      i32.store16 offset=390
      get_local 1
      i32.load
      i32.load offset=392
      i32.const 0
      i32.const 131072
      call 4
      drop
      get_local 2
      set_global 2
    end)
  (func (;8;) (type 1) (param i32)
    (local i32 i32)
    block  ;; label = @1
      get_global 2
      set_local 2
      get_global 2
      i32.const 16
      i32.add
      set_global 2
      get_local 2
      tee_local 1
      get_local 0
      i32.store
      get_local 1
      i32.load
      i32.eqz
      if  ;; label = @2
        get_local 2
        set_global 2
        return
      end
      get_local 1
      i32.load
      i32.load offset=40
      call 24
      get_local 1
      i32.load
      i32.load offset=392
      call 3
      get_local 1
      i32.load
      call 3
      get_local 2
      set_global 2
    end)
  (func (;9;) (type 1) (param i32)
    (local i32 i32)
    block  ;; label = @1
      get_global 2
      set_local 1
      get_global 2
      i32.const 16
      i32.add
      set_global 2
      get_local 1
      tee_local 2
      get_local 0
      i32.store
      get_local 2
      i32.load
      i32.eqz
      if  ;; label = @2
        get_local 1
        set_global 2
        return
      end
      get_local 2
      i32.load
      i32.const 1
      i32.store
      get_local 1
      set_global 2
    end)
  (func (;10;) (type 1) (param i32)
    (local i32 i32)
    block  ;; label = @1
      get_global 2
      set_local 1
      get_global 2
      i32.const 16
      i32.add
      set_global 2
      get_local 1
      tee_local 2
      get_local 0
      i32.store
      get_local 2
      i32.load
      i32.eqz
      if  ;; label = @2
        get_local 1
        set_global 2
        return
      end
      get_local 2
      i32.load
      i32.const 0
      i32.store
      get_local 1
      set_global 2
    end)
  (func (;11;) (type 6) (param i32 i32 i32)
    (local i32 i32 i32)
    block  ;; label = @1
      get_global 2
      set_local 3
      get_global 2
      i32.const 16
      i32.add
      set_global 2
      get_local 3
      i32.const 8
      i32.add
      tee_local 4
      get_local 0
      i32.store
      get_local 3
      i32.const 4
      i32.add
      tee_local 5
      get_local 1
      i32.store
      get_local 3
      tee_local 0
      get_local 2
      i32.store
      get_local 4
      i32.load
      i32.eqz
      if  ;; label = @2
        get_local 3
        set_global 2
        return
      end
      get_local 4
      i32.load
      set_local 1
      get_local 4
      i32.load
      i32.load
      i32.const 1
      i32.eq
      if  ;; label = @2
        get_local 1
        i32.const 1
        i32.store offset=8
        get_local 3
        set_global 2
        return
      end
      get_local 1
      i32.load offset=392
      get_local 5
      i32.load
      i32.const 131072
      get_local 0
      i32.load
      get_local 0
      i32.load
      i32.const 131072
      i32.gt_u
      select
      call 2
      drop
      get_local 0
      i32.load
      i32.const 131072
      i32.le_u
      if  ;; label = @2
        get_local 3
        set_global 2
        return
      end
      get_local 4
      i32.load
      i32.const 1
      i32.store offset=8
      get_local 3
      set_global 2
    end)
  (func (;12;) (type 2) (param i32) (result i32)
    (local i32 i32 i32 i32)
    block i32  ;; label = @1
      get_global 2
      set_local 3
      get_global 2
      i32.const 16
      i32.add
      set_global 2
      get_local 3
      i32.const 4
      i32.add
      set_local 2
      get_local 3
      tee_local 1
      get_local 0
      i32.store
      get_local 1
      i32.load
      i32.eqz
      if  ;; label = @2
        get_local 2
        i32.const 0
        i32.store
        get_local 3
        set_global 2
        get_local 2
        i32.load
        return
      end
      get_local 1
      i32.load
      i32.load offset=364
      i32.const 16
      i32.ge_u
      if  ;; label = @2
        get_local 2
        i32.const 0
        i32.store
        get_local 3
        set_global 2
        get_local 2
        i32.load
        return
      end
      get_local 1
      i32.load
      i32.load
      i32.const 1
      i32.eq
      if  ;; label = @2
        get_local 1
        i32.load
        i32.const 1
        i32.store offset=8
      end
      get_local 1
      i32.load
      i32.const 44
      i32.add
      set_local 4
      get_local 1
      i32.load
      i32.const 364
      i32.add
      tee_local 1
      i32.load
      set_local 0
      get_local 1
      get_local 0
      i32.const 1
      i32.add
      i32.store
      get_local 2
      get_local 4
      get_local 0
      i32.const 20
      i32.mul
      i32.add
      i32.store
      get_local 3
      set_global 2
      get_local 2
      i32.load
    end)
  (func (;13;) (type 1) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      get_global 2
      set_local 3
      get_global 2
      i32.const 64
      i32.add
      set_global 2
      get_local 3
      i32.const 40
      i32.add
      tee_local 1
      get_local 0
      i32.store
      get_local 1
      i32.load
      i32.eqz
      if  ;; label = @2
        get_local 3
        set_global 2
        return
      end
      get_local 1
      i32.load
      i32.load
      i32.eqz
      if  ;; label = @2
        get_local 3
        set_global 2
        return
      end
      get_local 1
      i32.load
      i32.load offset=8
      i32.const 1
      i32.eq
      if  ;; label = @2
        get_local 3
        set_global 2
        return
      end
      get_local 3
      i32.const 48
      i32.add
      set_local 7
      get_local 3
      i32.const 46
      i32.add
      set_local 8
      get_local 3
      i32.const 32
      i32.add
      set_local 9
      get_local 3
      i32.const 28
      i32.add
      set_local 10
      get_local 3
      i32.const 24
      i32.add
      set_local 11
      get_local 3
      i32.const 20
      i32.add
      set_local 12
      get_local 3
      i32.const 16
      i32.add
      set_local 13
      get_local 3
      i32.const 12
      i32.add
      set_local 14
      get_local 3
      i32.const 8
      i32.add
      set_local 15
      get_local 3
      i32.const 4
      i32.add
      set_local 16
      get_local 3
      i32.const 44
      i32.add
      set_local 17
      get_local 3
      set_local 0
      get_local 3
      i32.const 36
      i32.add
      tee_local 4
      i32.const 0
      i32.store
      loop  ;; label = @2
        get_local 4
        i32.load
        i32.eqz
        if  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    get_local 1
                    i32.load
                    i32.load offset=16
                    br_table 0 (;@8;) 1 (;@7;) 2 (;@6;) 3 (;@5;) 4 (;@4;)
                  end
                  get_local 1
                  i32.load
                  i32.load offset=12
                  i32.eqz
                  if  ;; label = @8
                    get_local 1
                    i32.load
                    i32.load offset=40
                    call 28
                    i32.eqz
                    if  ;; label = @9
                      get_local 1
                      i32.load
                      i32.const 1
                      i32.store offset=12
                      get_local 1
                      i32.load
                      get_local 1
                      i32.load
                      i32.load16_s offset=384
                      call 14
                      get_local 1
                      i32.load
                      get_local 1
                      i32.load
                      i32.load16_s offset=368
                      call 14
                      get_local 1
                      i32.load
                      get_local 1
                      i32.load
                      i32.load16_s offset=390
                      i32.store16 offset=384
                      get_local 1
                      i32.load
                      i32.load offset=40
                      call 27
                      set_local 2
                      get_local 1
                      i32.load
                      get_local 2
                      i32.store16 offset=368
                    end
                  end
                  get_local 1
                  i32.load
                  call 15
                  get_local 1
                  i32.load
                  call 16
                  get_local 1
                  i32.load
                  get_local 1
                  i32.load
                  i32.load16_s offset=22
                  i32.const 1
                  call 17
                  set_local 2
                  get_local 1
                  i32.load
                  get_local 2
                  i32.store offset=28
                  get_global 0
                  get_local 1
                  i32.load
                  i32.load16_u offset=22
                  i32.const 2
                  i32.shl
                  i32.add
                  i32.load
                  i32.const 0
                  i32.gt_u
                  if  ;; label = @8
                    get_local 4
                    i32.const 1
                    i32.store
                  end
                  get_local 1
                  i32.load
                  i32.const 1
                  i32.const 2
                  get_local 1
                  i32.load
                  i32.load16_u offset=20
                  select
                  i32.store offset=16
                  br 5 (;@2;)
                end
                get_local 1
                i32.load
                get_local 1
                i32.load
                i32.load16_s offset=24
                i32.const 0
                call 17
                set_local 2
                get_local 1
                i32.load
                get_local 2
                i32.store offset=32
                get_global 0
                get_local 1
                i32.load
                i32.load16_u offset=24
                i32.const 2
                i32.shl
                i32.add
                i32.load
                i32.const 0
                i32.gt_u
                if  ;; label = @7
                  get_local 4
                  i32.const 1
                  i32.store
                end
                get_local 1
                i32.load
                i32.const 2
                i32.store offset=16
                br 4 (;@2;)
              end
              get_local 1
              i32.load
              set_local 2
              block  ;; label = @6
                get_local 1
                i32.load
                i32.load offset=36
                i32.const 1
                i32.gt_u
                if  ;; label = @7
                  get_local 2
                  i32.const 36
                  i32.add
                  tee_local 2
                  get_local 2
                  i32.load
                  i32.const -1
                  i32.add
                  i32.store
                else
                  get_local 2
                  i32.const 0
                  i32.store offset=16
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
                                                              get_local 1
                                                              i32.load
                                                              i32.load16_u offset=20
                                                              br_table 0 (;@29;) 1 (;@28;) 2 (;@27;) 3 (;@26;) 4 (;@25;) 21 (;@8;) 5 (;@24;) 21 (;@8;) 6 (;@23;) 21 (;@8;) 7 (;@22;) 8 (;@21;) 9 (;@20;) 10 (;@19;) 21 (;@8;) 11 (;@18;) 12 (;@17;) 13 (;@16;) 14 (;@15;) 15 (;@14;) 16 (;@13;) 21 (;@8;) 17 (;@12;) 21 (;@8;) 21 (;@8;) 21 (;@8;) 18 (;@11;) 21 (;@8;) 21 (;@8;) 21 (;@8;) 19 (;@10;) 20 (;@9;) 21 (;@8;)
                                                            end
                                                            block  ;; label = @29
                                                              block  ;; label = @30
                                                                block  ;; label = @31
                                                                  block  ;; label = @32
                                                                    block  ;; label = @33
                                                                      block  ;; label = @34
                                                                        block  ;; label = @35
                                                                          block  ;; label = @36
                                                                            block  ;; label = @37
                                                                              block  ;; label = @38
                                                                                get_local 1
                                                                                i32.load
                                                                                i32.load16_u offset=24
                                                                                i32.const 1
                                                                                i32.sub
                                                                                br_table 0 (;@38;) 9 (;@29;) 9 (;@29;) 9 (;@29;) 9 (;@29;) 9 (;@29;) 9 (;@29;) 1 (;@37;) 2 (;@36;) 3 (;@35;) 4 (;@34;) 5 (;@33;) 9 (;@29;) 9 (;@29;) 9 (;@29;) 6 (;@32;) 7 (;@31;) 8 (;@30;) 9 (;@29;)
                                                                              end
                                                                              get_local 1
                                                                              i32.load
                                                                              i32.load16_s offset=384
                                                                              set_local 5
                                                                              get_local 1
                                                                              i32.load
                                                                              i32.load offset=392
                                                                              set_local 6
                                                                              get_local 1
                                                                              i32.load
                                                                              i32.const 386
                                                                              i32.add
                                                                              tee_local 18
                                                                              i32.load16_s
                                                                              set_local 2
                                                                              get_local 18
                                                                              get_local 2
                                                                              i32.const -1
                                                                              i32.add
                                                                              i32.store16
                                                                              get_local 6
                                                                              get_local 2
                                                                              i32.const 65535
                                                                              i32.and
                                                                              i32.const 1
                                                                              i32.shl
                                                                              i32.add
                                                                              get_local 5
                                                                              i32.store16
                                                                              get_local 1
                                                                              i32.load
                                                                              get_local 1
                                                                              i32.load
                                                                              i32.load offset=28
                                                                              i32.load16_s
                                                                              i32.store16 offset=384
                                                                              br 31 (;@6;)
                                                                            end
                                                                            get_local 1
                                                                            i32.load
                                                                            get_local 1
                                                                            i32.load
                                                                            i32.load offset=28
                                                                            i32.load16_s
                                                                            call 18
                                                                            br 30 (;@6;)
                                                                          end
                                                                          get_local 1
                                                                          i32.load
                                                                          i32.load offset=28
                                                                          get_local 1
                                                                          i32.load
                                                                          i32.load16_s offset=390
                                                                          i32.store16
                                                                          br 29 (;@6;)
                                                                        end
                                                                        get_local 1
                                                                        i32.load
                                                                        get_local 1
                                                                        i32.load
                                                                        i32.load offset=28
                                                                        i32.load16_s
                                                                        i32.store16 offset=390
                                                                        br 28 (;@6;)
                                                                      end
                                                                      get_local 1
                                                                      i32.load
                                                                      i32.const 0
                                                                      i32.store offset=12
                                                                      get_local 1
                                                                      i32.load
                                                                      i32.load offset=392
                                                                      set_local 5
                                                                      get_local 1
                                                                      i32.load
                                                                      i32.const 386
                                                                      i32.add
                                                                      tee_local 6
                                                                      i32.load16_s
                                                                      set_local 2
                                                                      get_local 6
                                                                      get_local 2
                                                                      i32.const 1
                                                                      i32.add
                                                                      i32.store16
                                                                      get_local 1
                                                                      i32.load
                                                                      get_local 5
                                                                      get_local 2
                                                                      i32.const 65535
                                                                      i32.and
                                                                      i32.const 1
                                                                      i32.shl
                                                                      i32.add
                                                                      i32.load16_s
                                                                      i32.store16 offset=368
                                                                      get_local 1
                                                                      i32.load
                                                                      i32.load offset=392
                                                                      set_local 5
                                                                      get_local 1
                                                                      i32.load
                                                                      i32.const 386
                                                                      i32.add
                                                                      tee_local 6
                                                                      i32.load16_s
                                                                      set_local 2
                                                                      get_local 6
                                                                      get_local 2
                                                                      i32.const 1
                                                                      i32.add
                                                                      i32.store16
                                                                      get_local 1
                                                                      i32.load
                                                                      get_local 5
                                                                      get_local 2
                                                                      i32.const 65535
                                                                      i32.and
                                                                      i32.const 1
                                                                      i32.shl
                                                                      i32.add
                                                                      i32.load16_s
                                                                      i32.store16 offset=384
                                                                      br 27 (;@6;)
                                                                    end
                                                                    get_local 1
                                                                    i32.load
                                                                    get_local 1
                                                                    i32.load
                                                                    i32.load offset=28
                                                                    i32.load16_u
                                                                    i32.eqz
                                                                    i32.store offset=12
                                                                    br 26 (;@6;)
                                                                  end
                                                                  get_local 1
                                                                  i32.load
                                                                  i32.load offset=28
                                                                  get_local 1
                                                                  i32.load
                                                                  i32.load offset=364
                                                                  i32.store16
                                                                  br 25 (;@6;)
                                                                end
                                                                get_local 7
                                                                get_local 1
                                                                i32.load
                                                                i32.load offset=28
                                                                i32.load16_s
                                                                i32.store16
                                                                get_local 1
                                                                i32.load
                                                                set_local 2
                                                                get_local 7
                                                                i32.load16_u
                                                                get_local 1
                                                                i32.load
                                                                i32.load offset=364
                                                                i32.ge_u
                                                                if  ;; label = @31
                                                                  get_local 2
                                                                  i32.const 0
                                                                  i32.store16 offset=368
                                                                  get_local 1
                                                                  i32.load
                                                                  i32.const 0
                                                                  i32.store16 offset=370
                                                                  get_local 1
                                                                  i32.load
                                                                  i32.const 0
                                                                  i32.store16 offset=372
                                                                  get_local 1
                                                                  i32.load
                                                                  i32.const 0
                                                                  i32.store16 offset=374
                                                                  get_local 1
                                                                  i32.load
                                                                  i32.const 0
                                                                  i32.store16 offset=376
                                                                  br 25 (;@6;)
                                                                else
                                                                  get_local 1
                                                                  i32.load
                                                                  get_local 1
                                                                  i32.load
                                                                  i32.const 44
                                                                  i32.add
                                                                  get_local 7
                                                                  i32.load16_u
                                                                  i32.const 20
                                                                  i32.mul
                                                                  i32.add
                                                                  get_local 2
                                                                  i32.const 44
                                                                  i32.add
                                                                  get_local 7
                                                                  i32.load16_u
                                                                  i32.const 20
                                                                  i32.mul
                                                                  i32.add
                                                                  i32.load
                                                                  call_indirect 0
                                                                  br 25 (;@6;)
                                                                end
                                                                unreachable
                                                              end
                                                              get_local 8
                                                              get_local 1
                                                              i32.load
                                                              i32.load offset=28
                                                              i32.load16_s
                                                              i32.store16
                                                              get_local 8
                                                              i32.load16_u
                                                              get_local 1
                                                              i32.load
                                                              i32.load offset=364
                                                              i32.ge_u
                                                              br_if 23 (;@6;)
                                                              get_local 1
                                                              i32.load
                                                              get_local 1
                                                              i32.load
                                                              i32.const 44
                                                              i32.add
                                                              get_local 8
                                                              i32.load16_u
                                                              i32.const 20
                                                              i32.mul
                                                              i32.add
                                                              get_local 1
                                                              i32.load
                                                              get_local 8
                                                              i32.load16_u
                                                              i32.const 20
                                                              i32.mul
                                                              i32.add
                                                              i32.load offset=48
                                                              call_indirect 0
                                                              br 23 (;@6;)
                                                            end
                                                            br 22 (;@6;)
                                                          end
                                                          get_local 1
                                                          i32.load
                                                          i32.load offset=32
                                                          get_local 1
                                                          i32.load
                                                          i32.load offset=28
                                                          i32.load16_s
                                                          i32.store16
                                                          br 21 (;@6;)
                                                        end
                                                        get_local 1
                                                        i32.load
                                                        i32.load offset=28
                                                        i32.load16_u
                                                        i32.const 65535
                                                        get_local 1
                                                        i32.load
                                                        i32.load offset=32
                                                        i32.load16_u
                                                        i32.sub
                                                        i32.gt_s
                                                        if  ;; label = @27
                                                          get_local 1
                                                          i32.load
                                                          i32.const 1
                                                          i32.store16 offset=388
                                                        end
                                                        get_local 1
                                                        i32.load
                                                        i32.const 0
                                                        i32.store16 offset=388
                                                        get_local 1
                                                        i32.load
                                                        i32.load offset=32
                                                        tee_local 2
                                                        get_local 2
                                                        i32.load16_u
                                                        get_local 1
                                                        i32.load
                                                        i32.load offset=28
                                                        i32.load16_u
                                                        i32.add
                                                        i32.store16
                                                        br 20 (;@6;)
                                                      end
                                                      get_local 1
                                                      i32.load
                                                      i32.load offset=28
                                                      i32.load16_u
                                                      get_local 1
                                                      i32.load
                                                      i32.load offset=32
                                                      i32.load16_u
                                                      i32.gt_s
                                                      if  ;; label = @26
                                                        get_local 1
                                                        i32.load
                                                        i32.const -1
                                                        i32.store16 offset=388
                                                      end
                                                      get_local 1
                                                      i32.load
                                                      i32.const 0
                                                      i32.store16 offset=388
                                                      get_local 1
                                                      i32.load
                                                      i32.load offset=32
                                                      tee_local 2
                                                      get_local 2
                                                      i32.load16_u
                                                      get_local 1
                                                      i32.load
                                                      i32.load offset=28
                                                      i32.load16_u
                                                      i32.sub
                                                      i32.store16
                                                      br 19 (;@6;)
                                                    end
                                                    get_local 9
                                                    get_local 1
                                                    i32.load
                                                    i32.load offset=32
                                                    i32.load16_u
                                                    i32.store
                                                    get_local 10
                                                    get_local 1
                                                    i32.load
                                                    i32.load offset=28
                                                    i32.load16_u
                                                    i32.store
                                                    get_local 1
                                                    i32.load
                                                    get_local 9
                                                    i32.load
                                                    get_local 10
                                                    i32.load
                                                    i32.mul
                                                    i32.const 16
                                                    i32.shr_u
                                                    i32.store16 offset=388
                                                    get_local 1
                                                    i32.load
                                                    i32.load offset=32
                                                    tee_local 2
                                                    get_local 2
                                                    i32.load16_u
                                                    get_local 1
                                                    i32.load
                                                    i32.load offset=28
                                                    i32.load16_u
                                                    i32.mul
                                                    i32.store16
                                                    br 18 (;@6;)
                                                  end
                                                  get_local 1
                                                  i32.load
                                                  set_local 2
                                                  get_local 1
                                                  i32.load
                                                  i32.load offset=28
                                                  i32.load16_u
                                                  if  ;; label = @24
                                                    get_local 11
                                                    get_local 2
                                                    i32.load offset=32
                                                    i32.load16_u
                                                    i32.store
                                                    get_local 12
                                                    get_local 1
                                                    i32.load
                                                    i32.load offset=28
                                                    i32.load16_u
                                                    i32.store
                                                    get_local 1
                                                    i32.load
                                                    get_local 11
                                                    i32.load
                                                    i32.const 16
                                                    i32.shl
                                                    get_local 12
                                                    i32.load
                                                    i32.div_u
                                                    i32.store16 offset=388
                                                    get_local 1
                                                    i32.load
                                                    i32.load offset=32
                                                    tee_local 2
                                                    get_local 2
                                                    i32.load16_u
                                                    get_local 1
                                                    i32.load
                                                    i32.load offset=28
                                                    i32.load16_u
                                                    i32.div_s
                                                    i32.store16
                                                    br 18 (;@6;)
                                                  else
                                                    get_local 2
                                                    i32.const 0
                                                    i32.store16 offset=388
                                                    get_local 1
                                                    i32.load
                                                    i32.load offset=32
                                                    i32.const 0
                                                    i32.store16
                                                    br 18 (;@6;)
                                                  end
                                                  unreachable
                                                end
                                                get_local 1
                                                i32.load
                                                i32.load offset=32
                                                set_local 2
                                                get_local 1
                                                i32.load
                                                i32.load offset=28
                                                i32.load16_u
                                                if  ;; label = @23
                                                  get_local 1
                                                  i32.load
                                                  i32.load offset=32
                                                  get_local 2
                                                  i32.load16_u
                                                  get_local 1
                                                  i32.load
                                                  i32.load offset=28
                                                  i32.load16_u
                                                  i32.rem_s
                                                  i32.store16
                                                  br 17 (;@6;)
                                                else
                                                  get_local 2
                                                  i32.const 0
                                                  i32.store16
                                                  br 17 (;@6;)
                                                end
                                                unreachable
                                              end
                                              get_local 1
                                              i32.load
                                              i32.load offset=32
                                              tee_local 2
                                              get_local 2
                                              i32.load16_u
                                              get_local 1
                                              i32.load
                                              i32.load offset=28
                                              i32.load16_u
                                              i32.and
                                              i32.store16
                                              br 15 (;@6;)
                                            end
                                            get_local 1
                                            i32.load
                                            i32.load offset=32
                                            tee_local 2
                                            get_local 2
                                            i32.load16_u
                                            get_local 1
                                            i32.load
                                            i32.load offset=28
                                            i32.load16_u
                                            i32.or
                                            i32.store16
                                            br 14 (;@6;)
                                          end
                                          get_local 1
                                          i32.load
                                          i32.load offset=32
                                          tee_local 2
                                          get_local 2
                                          i32.load16_u
                                          get_local 1
                                          i32.load
                                          i32.load offset=28
                                          i32.load16_u
                                          i32.xor
                                          i32.store16
                                          br 13 (;@6;)
                                        end
                                        get_local 13
                                        get_local 1
                                        i32.load
                                        i32.load offset=32
                                        i32.load16_u
                                        i32.store
                                        get_local 14
                                        get_local 1
                                        i32.load
                                        i32.load offset=28
                                        i32.load16_u
                                        i32.store
                                        get_local 1
                                        i32.load
                                        get_local 13
                                        i32.load
                                        i32.const 16
                                        i32.shl
                                        get_local 14
                                        i32.load
                                        i32.shr_u
                                        i32.store16 offset=388
                                        get_local 1
                                        i32.load
                                        i32.load offset=32
                                        tee_local 2
                                        get_local 2
                                        i32.load16_u
                                        get_local 1
                                        i32.load
                                        i32.load offset=28
                                        i32.load16_u
                                        i32.shr_s
                                        i32.store16
                                        br 12 (;@6;)
                                      end
                                      get_local 15
                                      get_local 1
                                      i32.load
                                      i32.load offset=32
                                      i32.load16_u
                                      i32.store
                                      get_local 16
                                      get_local 1
                                      i32.load
                                      i32.load offset=28
                                      i32.load16_u
                                      i32.store
                                      get_local 1
                                      i32.load
                                      get_local 15
                                      i32.load
                                      get_local 16
                                      i32.load
                                      i32.shl
                                      i32.const 16
                                      i32.shr_u
                                      i32.store16 offset=388
                                      get_local 1
                                      i32.load
                                      i32.load offset=32
                                      tee_local 2
                                      get_local 2
                                      i32.load16_u
                                      get_local 1
                                      i32.load
                                      i32.load offset=28
                                      i32.load16_u
                                      i32.shl
                                      i32.store16
                                      br 11 (;@6;)
                                    end
                                    get_local 1
                                    i32.load
                                    i32.load offset=32
                                    i32.load16_u
                                    get_local 1
                                    i32.load
                                    i32.load offset=28
                                    i32.load16_u
                                    i32.and
                                    br_if 10 (;@6;)
                                    get_local 1
                                    i32.load
                                    i32.const 3
                                    i32.store offset=16
                                    br 10 (;@6;)
                                  end
                                  get_local 1
                                  i32.load
                                  i32.load offset=32
                                  i32.load16_u
                                  get_local 1
                                  i32.load
                                  i32.load offset=28
                                  i32.load16_u
                                  i32.and
                                  i32.eqz
                                  br_if 9 (;@6;)
                                  get_local 1
                                  i32.load
                                  i32.const 3
                                  i32.store offset=16
                                  br 9 (;@6;)
                                end
                                get_local 1
                                i32.load
                                i32.load offset=28
                                i32.load16_u
                                get_local 1
                                i32.load
                                i32.load offset=32
                                i32.load16_u
                                i32.eq
                                br_if 8 (;@6;)
                                get_local 1
                                i32.load
                                i32.const 3
                                i32.store offset=16
                                br 8 (;@6;)
                              end
                              get_local 1
                              i32.load
                              i32.load offset=28
                              i32.load16_u
                              get_local 1
                              i32.load
                              i32.load offset=32
                              i32.load16_u
                              i32.ne
                              br_if 7 (;@6;)
                              get_local 1
                              i32.load
                              i32.const 3
                              i32.store offset=16
                              br 7 (;@6;)
                            end
                            get_local 1
                            i32.load
                            i32.load offset=28
                            i32.load16_u
                            get_local 1
                            i32.load
                            i32.load offset=32
                            i32.load16_u
                            i32.lt_s
                            br_if 6 (;@6;)
                            get_local 1
                            i32.load
                            i32.const 3
                            i32.store offset=16
                            br 6 (;@6;)
                          end
                          get_local 1
                          i32.load
                          i32.load offset=28
                          i32.load16_u
                          get_local 1
                          i32.load
                          i32.load offset=32
                          i32.load16_u
                          i32.gt_s
                          br_if 5 (;@6;)
                          get_local 1
                          i32.load
                          i32.const 3
                          i32.store offset=16
                          br 5 (;@6;)
                        end
                        get_local 1
                        i32.load
                        set_local 2
                        get_local 1
                        i32.load
                        i32.load offset=28
                        i32.load16_u
                        i32.const 65535
                        get_local 1
                        i32.load
                        i32.load offset=32
                        i32.load16_u
                        i32.sub
                        i32.gt_s
                        if  ;; label = @11
                          get_local 2
                          i32.const 1
                          i32.store16 offset=388
                        else
                          get_local 17
                          get_local 2
                          i32.load offset=32
                          i32.load16_u
                          get_local 1
                          i32.load
                          i32.load offset=28
                          i32.load16_u
                          i32.add
                          i32.store16
                          get_local 1
                          i32.load
                          i32.const 1
                          i32.const 0
                          get_local 17
                          i32.load16_u
                          i32.const 65535
                          get_local 1
                          i32.load
                          i32.load16_u offset=388
                          i32.sub
                          i32.gt_s
                          select
                          i32.store16 offset=388
                        end
                        get_local 1
                        i32.load
                        i32.load offset=32
                        tee_local 2
                        get_local 2
                        i32.load16_u
                        get_local 1
                        i32.load
                        i32.load offset=28
                        i32.load16_u
                        get_local 1
                        i32.load
                        i32.load16_u offset=388
                        i32.add
                        i32.add
                        i32.store16
                        br 4 (;@6;)
                      end
                      get_local 1
                      i32.load
                      i32.load offset=32
                      get_local 1
                      i32.load
                      i32.load offset=28
                      i32.load16_s
                      i32.store16
                      get_local 1
                      i32.load
                      i32.const 380
                      i32.add
                      tee_local 2
                      get_local 2
                      i32.load16_s
                      i32.const 1
                      i32.add
                      i32.store16
                      get_local 1
                      i32.load
                      i32.const 382
                      i32.add
                      tee_local 2
                      get_local 2
                      i32.load16_s
                      i32.const 1
                      i32.add
                      i32.store16
                      br 3 (;@6;)
                    end
                    get_local 1
                    i32.load
                    i32.load offset=32
                    get_local 1
                    i32.load
                    i32.load offset=28
                    i32.load16_s
                    i32.store16
                    get_local 1
                    i32.load
                    i32.const 380
                    i32.add
                    tee_local 2
                    get_local 2
                    i32.load16_s
                    i32.const -1
                    i32.add
                    i32.store16
                    get_local 1
                    i32.load
                    i32.const 382
                    i32.add
                    tee_local 2
                    get_local 2
                    i32.load16_s
                    i32.const -1
                    i32.add
                    i32.store16
                  end
                end
              end
              get_local 4
              i32.const 1
              i32.store
              br 3 (;@2;)
            end
            get_local 1
            i32.load
            call 15
            get_local 0
            i32.const 0
            i32.store
            get_local 0
            get_local 1
            i32.load
            get_local 1
            i32.load
            i32.load16_s offset=22
            i32.const 1
            call 17
            i32.store
            get_local 1
            i32.load
            i32.load16_u offset=20
            if  ;; label = @5
              get_local 0
              get_local 1
              i32.load
              get_local 1
              i32.load
              i32.load16_s offset=24
              i32.const 0
              call 17
              i32.store
            end
            get_local 1
            i32.load
            i32.load16_u offset=20
            i32.const -16
            i32.add
            i32.const 8
            i32.ge_u
            if  ;; label = @5
              get_local 1
              i32.load
              i32.const 0
              i32.store offset=16
            end
            get_local 4
            i32.const 1
            i32.store
            br 2 (;@2;)
          end
          br 1 (;@2;)
        end
      end
      get_local 3
      set_global 2
    end)
  (func (;14;) (type 0) (param i32 i32)
    (local i32 i32 i32)
    block  ;; label = @1
      get_global 2
      set_local 3
      get_global 2
      i32.const 16
      i32.add
      set_global 2
      get_local 3
      tee_local 2
      get_local 0
      i32.store
      get_local 3
      i32.const 4
      i32.add
      tee_local 0
      get_local 1
      i32.store16
      get_local 0
      i32.load16_s
      set_local 4
      get_local 2
      i32.load
      i32.load offset=392
      set_local 1
      get_local 2
      i32.load
      i32.const 386
      i32.add
      tee_local 0
      i32.load16_s
      i32.const -1
      i32.add
      i32.const 16
      i32.shl
      i32.const 16
      i32.shr_s
      set_local 2
      get_local 0
      get_local 2
      i32.store16
      get_local 1
      get_local 2
      i32.const 65535
      i32.and
      i32.const 1
      i32.shl
      i32.add
      get_local 4
      i32.store16
      get_local 3
      set_global 2
    end)
  (func (;15;) (type 1) (param i32)
    (local i32 i32 i32 i32)
    block  ;; label = @1
      get_global 2
      set_local 2
      get_global 2
      i32.const 16
      i32.add
      set_global 2
      get_local 2
      tee_local 1
      get_local 0
      i32.store
      get_local 1
      i32.load
      i32.load offset=392
      set_local 4
      get_local 1
      i32.load
      i32.const 384
      i32.add
      tee_local 0
      i32.load16_s
      set_local 3
      get_local 0
      get_local 3
      i32.const 1
      i32.add
      i32.store16
      get_local 2
      i32.const 4
      i32.add
      tee_local 0
      get_local 4
      get_local 3
      i32.const 65535
      i32.and
      i32.const 1
      i32.shl
      i32.add
      i32.load16_s
      i32.store16
      get_local 1
      i32.load
      get_local 0
      i32.load16_u
      i32.const 31
      i32.and
      i32.store16 offset=20
      get_local 1
      i32.load
      get_local 0
      i32.load16_u
      i32.const 10
      i32.shr_s
      i32.store16 offset=22
      get_local 1
      i32.load
      get_local 0
      i32.load16_u
      i32.const 5
      i32.shr_s
      i32.const 31
      i32.and
      i32.store16 offset=24
      get_local 2
      set_global 2
    end)
  (func (;16;) (type 1) (param i32)
    (local i32 i32)
    block  ;; label = @1
      get_global 2
      set_local 2
      get_global 2
      i32.const 16
      i32.add
      set_global 2
      get_local 2
      tee_local 1
      get_local 0
      i32.store
      get_local 1
      i32.load
      set_local 0
      get_local 1
      i32.load
      i32.load16_u offset=22
      if  ;; label = @2
        get_local 1
        i32.load
        get_global 0
        i32.const 384
        i32.add
        get_local 0
        i32.load16_u offset=20
        i32.const 2
        i32.shl
        i32.add
        i32.load
        i32.store offset=36
        get_local 2
        set_global 2
      else
        get_local 1
        i32.load
        get_global 0
        i32.const 256
        i32.add
        get_local 0
        i32.load16_u offset=24
        i32.const 2
        i32.shl
        i32.add
        i32.load
        i32.store offset=36
        get_local 2
        set_global 2
      end
    end)
  (func (;17;) (type 3) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    block i32  ;; label = @1
      get_global 2
      set_local 5
      get_global 2
      i32.const 16
      i32.add
      set_global 2
      get_local 5
      i32.const 8
      i32.add
      set_local 4
      get_local 5
      i32.const 4
      i32.add
      tee_local 3
      get_local 0
      i32.store
      get_local 5
      i32.const 12
      i32.add
      tee_local 6
      get_local 1
      i32.store16
      get_local 5
      tee_local 0
      get_local 2
      i32.store
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
                                                                        get_local 6
                                                                        i32.load16_u
                                                                        br_table 0 (;@34;) 1 (;@33;) 2 (;@32;) 3 (;@31;) 4 (;@30;) 5 (;@29;) 6 (;@28;) 7 (;@27;) 8 (;@26;) 9 (;@25;) 10 (;@24;) 11 (;@23;) 12 (;@22;) 13 (;@21;) 14 (;@20;) 15 (;@19;) 16 (;@18;) 17 (;@17;) 18 (;@16;) 19 (;@15;) 20 (;@14;) 21 (;@13;) 22 (;@12;) 23 (;@11;) 24 (;@10;) 25 (;@9;) 26 (;@8;) 27 (;@7;) 28 (;@6;) 29 (;@5;) 30 (;@4;) 31 (;@3;) 32 (;@2;)
                                                                      end
                                                                      get_local 4
                                                                      get_local 3
                                                                      i32.load
                                                                      i32.const 368
                                                                      i32.add
                                                                      i32.store
                                                                      get_local 5
                                                                      set_global 2
                                                                      get_local 4
                                                                      i32.load
                                                                      return
                                                                    end
                                                                    get_local 4
                                                                    get_local 3
                                                                    i32.load
                                                                    i32.const 370
                                                                    i32.add
                                                                    i32.store
                                                                    get_local 5
                                                                    set_global 2
                                                                    get_local 4
                                                                    i32.load
                                                                    return
                                                                  end
                                                                  get_local 4
                                                                  get_local 3
                                                                  i32.load
                                                                  i32.const 372
                                                                  i32.add
                                                                  i32.store
                                                                  get_local 5
                                                                  set_global 2
                                                                  get_local 4
                                                                  i32.load
                                                                  return
                                                                end
                                                                get_local 4
                                                                get_local 3
                                                                i32.load
                                                                i32.const 374
                                                                i32.add
                                                                i32.store
                                                                get_local 5
                                                                set_global 2
                                                                get_local 4
                                                                i32.load
                                                                return
                                                              end
                                                              get_local 4
                                                              get_local 3
                                                              i32.load
                                                              i32.const 376
                                                              i32.add
                                                              i32.store
                                                              get_local 5
                                                              set_global 2
                                                              get_local 4
                                                              i32.load
                                                              return
                                                            end
                                                            get_local 4
                                                            get_local 3
                                                            i32.load
                                                            i32.const 378
                                                            i32.add
                                                            i32.store
                                                            get_local 5
                                                            set_global 2
                                                            get_local 4
                                                            i32.load
                                                            return
                                                          end
                                                          get_local 4
                                                          get_local 3
                                                          i32.load
                                                          i32.const 380
                                                          i32.add
                                                          i32.store
                                                          get_local 5
                                                          set_global 2
                                                          get_local 4
                                                          i32.load
                                                          return
                                                        end
                                                        get_local 4
                                                        get_local 3
                                                        i32.load
                                                        i32.const 382
                                                        i32.add
                                                        i32.store
                                                        get_local 5
                                                        set_global 2
                                                        get_local 4
                                                        i32.load
                                                        return
                                                      end
                                                      get_local 4
                                                      get_local 3
                                                      i32.load
                                                      i32.load offset=392
                                                      get_local 3
                                                      i32.load
                                                      i32.load16_u offset=368
                                                      i32.const 1
                                                      i32.shl
                                                      i32.add
                                                      i32.store
                                                      get_local 5
                                                      set_global 2
                                                      get_local 4
                                                      i32.load
                                                      return
                                                    end
                                                    get_local 4
                                                    get_local 3
                                                    i32.load
                                                    i32.load offset=392
                                                    get_local 3
                                                    i32.load
                                                    i32.load16_u offset=370
                                                    i32.const 1
                                                    i32.shl
                                                    i32.add
                                                    i32.store
                                                    get_local 5
                                                    set_global 2
                                                    get_local 4
                                                    i32.load
                                                    return
                                                  end
                                                  get_local 4
                                                  get_local 3
                                                  i32.load
                                                  i32.load offset=392
                                                  get_local 3
                                                  i32.load
                                                  i32.load16_u offset=372
                                                  i32.const 1
                                                  i32.shl
                                                  i32.add
                                                  i32.store
                                                  get_local 5
                                                  set_global 2
                                                  get_local 4
                                                  i32.load
                                                  return
                                                end
                                                get_local 4
                                                get_local 3
                                                i32.load
                                                i32.load offset=392
                                                get_local 3
                                                i32.load
                                                i32.load16_u offset=374
                                                i32.const 1
                                                i32.shl
                                                i32.add
                                                i32.store
                                                get_local 5
                                                set_global 2
                                                get_local 4
                                                i32.load
                                                return
                                              end
                                              get_local 4
                                              get_local 3
                                              i32.load
                                              i32.load offset=392
                                              get_local 3
                                              i32.load
                                              i32.load16_u offset=376
                                              i32.const 1
                                              i32.shl
                                              i32.add
                                              i32.store
                                              get_local 5
                                              set_global 2
                                              get_local 4
                                              i32.load
                                              return
                                            end
                                            get_local 4
                                            get_local 3
                                            i32.load
                                            i32.load offset=392
                                            get_local 3
                                            i32.load
                                            i32.load16_u offset=378
                                            i32.const 1
                                            i32.shl
                                            i32.add
                                            i32.store
                                            get_local 5
                                            set_global 2
                                            get_local 4
                                            i32.load
                                            return
                                          end
                                          get_local 4
                                          get_local 3
                                          i32.load
                                          i32.load offset=392
                                          get_local 3
                                          i32.load
                                          i32.load16_u offset=380
                                          i32.const 1
                                          i32.shl
                                          i32.add
                                          i32.store
                                          get_local 5
                                          set_global 2
                                          get_local 4
                                          i32.load
                                          return
                                        end
                                        get_local 4
                                        get_local 3
                                        i32.load
                                        i32.load offset=392
                                        get_local 3
                                        i32.load
                                        i32.load16_u offset=382
                                        i32.const 1
                                        i32.shl
                                        i32.add
                                        i32.store
                                        get_local 5
                                        set_global 2
                                        get_local 4
                                        i32.load
                                        return
                                      end
                                      get_local 3
                                      i32.load
                                      i32.load offset=392
                                      set_local 1
                                      get_local 3
                                      i32.load
                                      i32.load16_u offset=368
                                      set_local 2
                                      get_local 3
                                      i32.load
                                      i32.load offset=392
                                      set_local 6
                                      get_local 3
                                      i32.load
                                      i32.const 384
                                      i32.add
                                      tee_local 3
                                      i32.load16_s
                                      set_local 0
                                      get_local 3
                                      get_local 0
                                      i32.const 1
                                      i32.add
                                      i32.store16
                                      get_local 4
                                      get_local 1
                                      get_local 2
                                      get_local 6
                                      get_local 0
                                      i32.const 65535
                                      i32.and
                                      i32.const 1
                                      i32.shl
                                      i32.add
                                      i32.load16_u
                                      i32.add
                                      i32.const 1
                                      i32.shl
                                      i32.add
                                      i32.store
                                      get_local 5
                                      set_global 2
                                      get_local 4
                                      i32.load
                                      return
                                    end
                                    get_local 3
                                    i32.load
                                    i32.load offset=392
                                    set_local 1
                                    get_local 3
                                    i32.load
                                    i32.load16_u offset=370
                                    set_local 2
                                    get_local 3
                                    i32.load
                                    i32.load offset=392
                                    set_local 6
                                    get_local 3
                                    i32.load
                                    i32.const 384
                                    i32.add
                                    tee_local 3
                                    i32.load16_s
                                    set_local 0
                                    get_local 3
                                    get_local 0
                                    i32.const 1
                                    i32.add
                                    i32.store16
                                    get_local 4
                                    get_local 1
                                    get_local 2
                                    get_local 6
                                    get_local 0
                                    i32.const 65535
                                    i32.and
                                    i32.const 1
                                    i32.shl
                                    i32.add
                                    i32.load16_u
                                    i32.add
                                    i32.const 1
                                    i32.shl
                                    i32.add
                                    i32.store
                                    get_local 5
                                    set_global 2
                                    get_local 4
                                    i32.load
                                    return
                                  end
                                  get_local 3
                                  i32.load
                                  i32.load offset=392
                                  set_local 1
                                  get_local 3
                                  i32.load
                                  i32.load16_u offset=372
                                  set_local 2
                                  get_local 3
                                  i32.load
                                  i32.load offset=392
                                  set_local 6
                                  get_local 3
                                  i32.load
                                  i32.const 384
                                  i32.add
                                  tee_local 3
                                  i32.load16_s
                                  set_local 0
                                  get_local 3
                                  get_local 0
                                  i32.const 1
                                  i32.add
                                  i32.store16
                                  get_local 4
                                  get_local 1
                                  get_local 2
                                  get_local 6
                                  get_local 0
                                  i32.const 65535
                                  i32.and
                                  i32.const 1
                                  i32.shl
                                  i32.add
                                  i32.load16_u
                                  i32.add
                                  i32.const 1
                                  i32.shl
                                  i32.add
                                  i32.store
                                  get_local 5
                                  set_global 2
                                  get_local 4
                                  i32.load
                                  return
                                end
                                get_local 3
                                i32.load
                                i32.load offset=392
                                set_local 1
                                get_local 3
                                i32.load
                                i32.load16_u offset=374
                                set_local 2
                                get_local 3
                                i32.load
                                i32.load offset=392
                                set_local 6
                                get_local 3
                                i32.load
                                i32.const 384
                                i32.add
                                tee_local 3
                                i32.load16_s
                                set_local 0
                                get_local 3
                                get_local 0
                                i32.const 1
                                i32.add
                                i32.store16
                                get_local 4
                                get_local 1
                                get_local 2
                                get_local 6
                                get_local 0
                                i32.const 65535
                                i32.and
                                i32.const 1
                                i32.shl
                                i32.add
                                i32.load16_u
                                i32.add
                                i32.const 1
                                i32.shl
                                i32.add
                                i32.store
                                get_local 5
                                set_global 2
                                get_local 4
                                i32.load
                                return
                              end
                              get_local 3
                              i32.load
                              i32.load offset=392
                              set_local 1
                              get_local 3
                              i32.load
                              i32.load16_u offset=376
                              set_local 2
                              get_local 3
                              i32.load
                              i32.load offset=392
                              set_local 6
                              get_local 3
                              i32.load
                              i32.const 384
                              i32.add
                              tee_local 3
                              i32.load16_s
                              set_local 0
                              get_local 3
                              get_local 0
                              i32.const 1
                              i32.add
                              i32.store16
                              get_local 4
                              get_local 1
                              get_local 2
                              get_local 6
                              get_local 0
                              i32.const 65535
                              i32.and
                              i32.const 1
                              i32.shl
                              i32.add
                              i32.load16_u
                              i32.add
                              i32.const 1
                              i32.shl
                              i32.add
                              i32.store
                              get_local 5
                              set_global 2
                              get_local 4
                              i32.load
                              return
                            end
                            get_local 3
                            i32.load
                            i32.load offset=392
                            set_local 1
                            get_local 3
                            i32.load
                            i32.load16_u offset=378
                            set_local 2
                            get_local 3
                            i32.load
                            i32.load offset=392
                            set_local 6
                            get_local 3
                            i32.load
                            i32.const 384
                            i32.add
                            tee_local 3
                            i32.load16_s
                            set_local 0
                            get_local 3
                            get_local 0
                            i32.const 1
                            i32.add
                            i32.store16
                            get_local 4
                            get_local 1
                            get_local 2
                            get_local 6
                            get_local 0
                            i32.const 65535
                            i32.and
                            i32.const 1
                            i32.shl
                            i32.add
                            i32.load16_u
                            i32.add
                            i32.const 1
                            i32.shl
                            i32.add
                            i32.store
                            get_local 5
                            set_global 2
                            get_local 4
                            i32.load
                            return
                          end
                          get_local 3
                          i32.load
                          i32.load offset=392
                          set_local 1
                          get_local 3
                          i32.load
                          i32.load16_u offset=380
                          set_local 2
                          get_local 3
                          i32.load
                          i32.load offset=392
                          set_local 6
                          get_local 3
                          i32.load
                          i32.const 384
                          i32.add
                          tee_local 3
                          i32.load16_s
                          set_local 0
                          get_local 3
                          get_local 0
                          i32.const 1
                          i32.add
                          i32.store16
                          get_local 4
                          get_local 1
                          get_local 2
                          get_local 6
                          get_local 0
                          i32.const 65535
                          i32.and
                          i32.const 1
                          i32.shl
                          i32.add
                          i32.load16_u
                          i32.add
                          i32.const 1
                          i32.shl
                          i32.add
                          i32.store
                          get_local 5
                          set_global 2
                          get_local 4
                          i32.load
                          return
                        end
                        get_local 3
                        i32.load
                        i32.load offset=392
                        set_local 1
                        get_local 3
                        i32.load
                        i32.load16_u offset=382
                        set_local 2
                        get_local 3
                        i32.load
                        i32.load offset=392
                        set_local 6
                        get_local 3
                        i32.load
                        i32.const 384
                        i32.add
                        tee_local 3
                        i32.load16_s
                        set_local 0
                        get_local 3
                        get_local 0
                        i32.const 1
                        i32.add
                        i32.store16
                        get_local 4
                        get_local 1
                        get_local 2
                        get_local 6
                        get_local 0
                        i32.const 65535
                        i32.and
                        i32.const 1
                        i32.shl
                        i32.add
                        i32.load16_u
                        i32.add
                        i32.const 1
                        i32.shl
                        i32.add
                        i32.store
                        get_local 5
                        set_global 2
                        get_local 4
                        i32.load
                        return
                      end
                      get_local 3
                      i32.load
                      i32.load offset=392
                      set_local 2
                      get_local 3
                      i32.load
                      i32.const 386
                      i32.add
                      tee_local 3
                      i32.load16_s
                      set_local 1
                      get_local 0
                      i32.load
                      if  ;; label = @10
                        get_local 3
                        get_local 1
                        i32.const 1
                        i32.add
                        i32.const 16
                        i32.shl
                        i32.const 16
                        i32.shr_s
                        tee_local 0
                        i32.store16
                        get_local 4
                        get_local 2
                        get_local 0
                        i32.const 65535
                        i32.and
                        i32.const 1
                        i32.shl
                        i32.add
                        i32.store
                        get_local 5
                        set_global 2
                        get_local 4
                        i32.load
                        return
                      else
                        get_local 3
                        get_local 1
                        i32.const -1
                        i32.add
                        i32.store16
                        get_local 4
                        get_local 2
                        get_local 1
                        i32.const 65535
                        i32.and
                        i32.const 1
                        i32.shl
                        i32.add
                        i32.store
                        get_local 5
                        set_global 2
                        get_local 4
                        i32.load
                        return
                      end
                      unreachable
                    end
                    get_local 4
                    get_local 3
                    i32.load
                    i32.load offset=392
                    get_local 3
                    i32.load
                    i32.load16_u offset=386
                    i32.const 1
                    i32.shl
                    i32.add
                    i32.store
                    get_local 5
                    set_global 2
                    get_local 4
                    i32.load
                    return
                  end
                  get_local 3
                  i32.load
                  i32.load offset=392
                  set_local 1
                  get_local 3
                  i32.load
                  i32.load16_u offset=386
                  set_local 2
                  get_local 3
                  i32.load
                  i32.load offset=392
                  set_local 6
                  get_local 3
                  i32.load
                  i32.const 384
                  i32.add
                  tee_local 3
                  i32.load16_s
                  set_local 0
                  get_local 3
                  get_local 0
                  i32.const 1
                  i32.add
                  i32.store16
                  get_local 4
                  get_local 1
                  get_local 2
                  get_local 6
                  get_local 0
                  i32.const 65535
                  i32.and
                  i32.const 1
                  i32.shl
                  i32.add
                  i32.load16_u
                  i32.add
                  i32.const 1
                  i32.shl
                  i32.add
                  i32.store
                  get_local 5
                  set_global 2
                  get_local 4
                  i32.load
                  return
                end
                get_local 4
                get_local 3
                i32.load
                i32.const 386
                i32.add
                i32.store
                get_local 5
                set_global 2
                get_local 4
                i32.load
                return
              end
              get_local 4
              get_local 3
              i32.load
              i32.const 384
              i32.add
              i32.store
              get_local 5
              set_global 2
              get_local 4
              i32.load
              return
            end
            get_local 4
            get_local 3
            i32.load
            i32.const 388
            i32.add
            i32.store
            get_local 5
            set_global 2
            get_local 4
            i32.load
            return
          end
          get_local 3
          i32.load
          i32.load offset=392
          set_local 1
          get_local 3
          i32.load
          i32.load offset=392
          set_local 2
          get_local 3
          i32.load
          i32.const 384
          i32.add
          tee_local 3
          i32.load16_s
          set_local 0
          get_local 3
          get_local 0
          i32.const 1
          i32.add
          i32.store16
          get_local 4
          get_local 1
          get_local 2
          get_local 0
          i32.const 65535
          i32.and
          i32.const 1
          i32.shl
          i32.add
          i32.load16_u
          i32.const 1
          i32.shl
          i32.add
          i32.store
          get_local 5
          set_global 2
          get_local 4
          i32.load
          return
        end
        get_local 3
        i32.load
        i32.load offset=392
        set_local 1
        get_local 3
        i32.load
        i32.const 384
        i32.add
        tee_local 2
        i32.load16_s
        set_local 0
        get_local 2
        get_local 0
        i32.const 1
        i32.add
        i32.store16
        get_local 4
        get_local 1
        get_local 0
        i32.const 65535
        i32.and
        i32.const 1
        i32.shl
        i32.add
        i32.store
        get_local 5
        set_global 2
        get_local 4
        i32.load
        return
      end
      get_local 4
      i32.const 0
      i32.store
      get_local 5
      set_global 2
      get_local 4
      i32.load
    end)
  (func (;18;) (type 0) (param i32 i32)
    (local i32 i32)
    block  ;; label = @1
      get_global 2
      set_local 2
      get_global 2
      i32.const 16
      i32.add
      set_global 2
      get_local 2
      tee_local 3
      get_local 0
      i32.store
      get_local 2
      i32.const 4
      i32.add
      tee_local 0
      get_local 1
      i32.store16
      get_local 3
      i32.load
      i32.eqz
      if  ;; label = @2
        get_local 2
        set_global 2
        return
      end
      get_local 3
      i32.load
      i32.load offset=40
      get_local 0
      i32.load16_s
      call 26
      if  ;; label = @2
        get_local 2
        set_global 2
        return
      end
      get_local 3
      i32.load
      i32.const 1
      i32.store offset=8
      get_local 2
      set_global 2
    end)
  (func (;19;) (type 0) (param i32 i32)
    (local i32 i32 i32)
    block  ;; label = @1
      get_global 2
      set_local 2
      get_global 2
      i32.const 16
      i32.add
      set_global 2
      get_local 2
      i32.const 8
      i32.add
      tee_local 3
      get_local 0
      i32.store
      get_local 2
      i32.const 4
      i32.add
      tee_local 4
      get_local 1
      i32.store
      get_local 3
      i32.load
      i32.eqz
      if  ;; label = @2
        get_local 2
        set_global 2
        return
      end
      get_local 2
      tee_local 0
      i32.const 0
      i32.store
      loop  ;; label = @2
        get_local 0
        i32.load
        get_local 4
        i32.load
        i32.lt_u
        if  ;; label = @3
          get_local 3
          i32.load
          call 13
          get_local 0
          get_local 0
          i32.load
          i32.const 1
          i32.add
          i32.store
          br 1 (;@2;)
        end
      end
      get_local 2
      set_global 2
    end)
  (func (;20;) (type 6) (param i32 i32 i32)
    (local i32 i32)
    block  ;; label = @1
      get_global 2
      set_local 3
      get_global 2
      i32.const 16
      i32.add
      set_global 2
      get_local 3
      i32.const 4
      i32.add
      tee_local 4
      get_local 0
      i32.store
      get_local 3
      tee_local 0
      get_local 1
      i32.store
      get_local 3
      i32.const 8
      i32.add
      tee_local 1
      get_local 2
      i32.store16
      get_local 4
      i32.load
      i32.eqz
      if  ;; label = @2
        get_local 3
        set_global 2
        return
      end
      get_local 4
      i32.load
      i32.const 368
      i32.add
      get_local 0
      i32.load
      i32.const 1
      i32.shl
      i32.add
      get_local 1
      i32.load16_s
      i32.store16
      get_local 3
      set_global 2
    end)
  (func (;21;) (type 4) (param i32 i32) (result i32)
    (local i32 i32 i32)
    block i32  ;; label = @1
      get_global 2
      set_local 2
      get_global 2
      i32.const 16
      i32.add
      set_global 2
      get_local 2
      i32.const 8
      i32.add
      set_local 3
      get_local 2
      i32.const 4
      i32.add
      tee_local 4
      get_local 0
      i32.store
      get_local 2
      tee_local 0
      get_local 1
      i32.store
      get_local 4
      i32.load
      if i32  ;; label = @2
        get_local 3
        get_local 4
        i32.load
        i32.const 368
        i32.add
        get_local 0
        i32.load
        i32.const 1
        i32.shl
        i32.add
        i32.load16_s
        i32.store16
        get_local 2
        set_global 2
        get_local 3
        i32.load16_s
      else
        get_local 3
        i32.const 0
        i32.store16
        get_local 2
        set_global 2
        get_local 3
        i32.load16_s
      end
    end)
  (func (;22;) (type 2) (param i32) (result i32)
    (local i32 i32 i32)
    block i32  ;; label = @1
      get_global 2
      set_local 1
      get_global 2
      i32.const 16
      i32.add
      set_global 2
      get_local 1
      i32.const 4
      i32.add
      set_local 2
      get_local 1
      tee_local 3
      get_local 0
      i32.store
      get_local 3
      i32.load
      if i32  ;; label = @2
        get_local 2
        get_local 3
        i32.load
        i32.load offset=392
        i32.store
        get_local 1
        set_global 2
        get_local 2
        i32.load
      else
        get_local 2
        i32.const 0
        i32.store
        get_local 1
        set_global 2
        get_local 2
        i32.load
      end
    end)
  (func (;23;) (type 5) (result i32)
    (local i32 i32 i32)
    block i32  ;; label = @1
      get_global 2
      set_local 1
      get_global 2
      i32.const 16
      i32.add
      set_global 2
      get_local 1
      i32.const 4
      i32.add
      set_local 2
      get_local 1
      tee_local 0
      i32.const 1
      i32.const 524
      call 5
      i32.store
      get_local 0
      i32.load
      if i32  ;; label = @2
        get_local 0
        i32.load
        i32.const 1
        i32.store offset=4
        get_local 0
        i32.load
        i32.const 0
        i32.store offset=8
        get_local 0
        i32.load
        i32.const 0
        i32.store
        get_local 2
        get_local 0
        i32.load
        i32.store
        get_local 1
        set_global 2
        get_local 2
        i32.load
      else
        get_local 2
        i32.const 0
        i32.store
        get_local 1
        set_global 2
        get_local 2
        i32.load
      end
    end)
  (func (;24;) (type 1) (param i32)
    (local i32 i32)
    block  ;; label = @1
      get_global 2
      set_local 1
      get_global 2
      i32.const 16
      i32.add
      set_global 2
      get_local 1
      tee_local 2
      get_local 0
      i32.store
      get_local 2
      i32.load
      call 3
      get_local 1
      set_global 2
    end)
  (func (;25;) (type 1) (param i32)
    (local i32 i32)
    block  ;; label = @1
      get_global 2
      set_local 2
      get_global 2
      i32.const 16
      i32.add
      set_global 2
      get_local 2
      tee_local 1
      get_local 0
      i32.store
      get_local 1
      i32.load
      i32.const 1
      i32.store offset=4
      get_local 1
      i32.load
      i32.const 0
      i32.store offset=8
      get_local 1
      i32.load
      i32.const 0
      i32.store
      get_local 2
      set_global 2
    end)
  (func (;26;) (type 4) (param i32 i32) (result i32)
    (local i32 i32 i32 i32)
    block i32  ;; label = @1
      get_global 2
      set_local 3
      get_global 2
      i32.const 16
      i32.add
      set_global 2
      get_local 3
      i32.const 4
      i32.add
      set_local 4
      get_local 3
      tee_local 2
      get_local 0
      i32.store
      get_local 3
      i32.const 8
      i32.add
      tee_local 5
      get_local 1
      i32.store16
      get_local 2
      i32.load
      i32.load
      i32.const 256
      i32.ge_u
      if  ;; label = @2
        get_local 4
        i32.const 0
        i32.store
        get_local 3
        set_global 2
        get_local 4
        i32.load
        return
      end
      get_local 2
      i32.load
      i32.const 8
      i32.add
      tee_local 0
      get_local 0
      i32.load
      i32.const 1
      i32.add
      i32.store
      get_local 2
      i32.load
      i32.load offset=8
      i32.const 256
      i32.ge_u
      if  ;; label = @2
        get_local 2
        i32.load
        i32.const 0
        i32.store offset=8
      end
      get_local 2
      i32.load
      i32.const 12
      i32.add
      get_local 2
      i32.load
      i32.load offset=8
      i32.const 1
      i32.shl
      i32.add
      get_local 5
      i32.load16_s
      i32.store16
      get_local 2
      i32.load
      tee_local 0
      get_local 0
      i32.load
      i32.const 1
      i32.add
      i32.store
      get_local 4
      i32.const 1
      i32.store
      get_local 3
      set_global 2
      get_local 4
      i32.load
    end)
  (func (;27;) (type 2) (param i32) (result i32)
    (local i32 i32 i32)
    block i32  ;; label = @1
      get_global 2
      set_local 2
      get_global 2
      i32.const 16
      i32.add
      set_global 2
      get_local 2
      tee_local 1
      get_local 0
      i32.store
      get_local 2
      i32.const 4
      i32.add
      tee_local 3
      get_local 1
      i32.load
      i32.const 12
      i32.add
      get_local 1
      i32.load
      i32.load offset=4
      i32.const 1
      i32.shl
      i32.add
      i32.load16_s
      i32.store16
      get_local 1
      i32.load
      tee_local 0
      get_local 0
      i32.load
      i32.const -1
      i32.add
      i32.store
      get_local 1
      i32.load
      i32.const 4
      i32.add
      tee_local 0
      get_local 0
      i32.load
      i32.const 1
      i32.add
      i32.store
      get_local 1
      i32.load
      i32.load offset=4
      i32.const 256
      i32.lt_u
      if  ;; label = @2
        get_local 2
        set_global 2
        get_local 3
        i32.load16_s
        return
      end
      get_local 1
      i32.load
      i32.const 0
      i32.store offset=4
      get_local 2
      set_global 2
      get_local 3
      i32.load16_s
    end)
  (func (;28;) (type 2) (param i32) (result i32)
    (local i32 i32)
    block i32  ;; label = @1
      get_global 2
      set_local 1
      get_global 2
      i32.const 16
      i32.add
      set_global 2
      get_local 1
      tee_local 2
      get_local 0
      i32.store
      get_local 1
      set_global 2
      get_local 2
      i32.load
      i32.load
      i32.eqz
    end)
  (func (;29;) (type 1) (param i32)
    (local i32 i32)
    block  ;; label = @1
      get_global 2
      set_local 2
      get_global 2
      i32.const 16
      i32.add
      set_global 2
      get_local 2
      i32.const 4
      i32.add
      tee_local 1
      get_local 0
      i32.store
      get_local 1
      i32.load
      i32.eqz
      if  ;; label = @2
        get_local 2
        set_global 2
        return
      end
      get_local 1
      i32.load
      get_global 1
      i32.const 1
      i32.add
      i32.store
      get_local 1
      i32.load
      get_global 1
      i32.const 2
      i32.add
      i32.store offset=4
      get_local 1
      i32.load
      get_global 1
      i32.const 3
      i32.add
      i32.store offset=8
      get_local 1
      i32.load
      get_global 1
      i32.const 4
      i32.add
      i32.store offset=12
      get_local 2
      tee_local 0
      i32.const 8
      call 1
      i32.store
      get_local 0
      i32.load
      i32.const -32768
      i32.store16
      get_local 0
      i32.load
      i32.const 0
      i32.store16 offset=2
      get_local 0
      i32.load
      i32.const 0
      i32.store16 offset=4
      get_local 0
      i32.load
      i32.const 0
      i32.store16 offset=6
      get_local 1
      i32.load
      get_local 0
      i32.load
      i32.store offset=16
      get_local 2
      set_global 2
    end)
  (func (;30;) (type 0) (param i32 i32)
    (local i32 i32)
    block  ;; label = @1
      get_global 2
      set_local 2
      get_global 2
      i32.const 16
      i32.add
      set_global 2
      get_local 2
      i32.const 8
      i32.add
      tee_local 3
      get_local 0
      i32.store
      get_local 2
      i32.const 4
      i32.add
      tee_local 0
      get_local 1
      i32.store
      get_local 3
      i32.load
      i32.eqz
      get_local 0
      i32.load
      i32.eqz
      i32.or
      if  ;; label = @2
        get_local 2
        set_global 2
        return
      end
      get_local 2
      tee_local 0
      get_local 3
      i32.load
      i32.store
      get_local 0
      i32.load
      i32.const 0
      i32.const -2539
      call 20
      get_local 0
      i32.load
      i32.const 1
      i32.const 29513
      call 20
      get_local 0
      i32.load
      i32.const 2
      i32.const 6146
      call 20
      get_local 0
      i32.load
      i32.const 3
      i32.const -29898
      call 20
      get_local 0
      i32.load
      i32.const 4
      i32.const 7276
      call 20
      get_local 2
      set_global 2
    end)
  (func (;31;) (type 0) (param i32 i32)
    (local i32 i32 i32)
    block  ;; label = @1
      get_global 2
      set_local 2
      get_global 2
      i32.const 32
      i32.add
      set_global 2
      get_local 2
      i32.const 12
      i32.add
      tee_local 3
      get_local 0
      i32.store
      get_local 2
      i32.const 8
      i32.add
      tee_local 4
      get_local 1
      i32.store
      get_local 3
      i32.load
      i32.eqz
      get_local 4
      i32.load
      i32.eqz
      i32.or
      if  ;; label = @2
        get_local 2
        set_global 2
        return
      end
      get_local 2
      i32.const 4
      i32.add
      tee_local 0
      get_local 3
      i32.load
      i32.store
      get_local 2
      i32.const 18
      i32.add
      tee_local 3
      get_local 0
      i32.load
      i32.const 0
      call 21
      i32.store16
      get_local 2
      i32.const 16
      i32.add
      tee_local 1
      get_local 0
      i32.load
      i32.const 1
      call 21
      i32.store16
      get_local 2
      tee_local 0
      get_local 4
      i32.load
      i32.load offset=16
      i32.store
      get_local 0
      i32.load
      i32.eqz
      if  ;; label = @2
        get_local 2
        set_global 2
        return
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                get_local 3
                i32.load16_u
                br_table 0 (;@6;) 1 (;@5;) 2 (;@4;) 3 (;@3;) 4 (;@2;)
              end
              get_local 0
              i32.load
              get_local 1
              i32.load16_s
              i32.store16
              get_local 2
              set_global 2
              return
            end
            get_local 0
            i32.load
            get_local 1
            i32.load16_s
            i32.store16 offset=2
            get_local 2
            set_global 2
            return
          end
          get_local 0
          i32.load
          get_local 1
          i32.load16_s
          i32.store16 offset=4
          get_local 2
          set_global 2
          return
        end
        get_local 0
        i32.load
        get_local 1
        i32.load16_u
        i32.const 15
        i32.and
        i32.store16 offset=6
        get_local 2
        set_global 2
        return
      end
      get_local 2
      set_global 2
    end)
  (func (;32;) (type 0) (param i32 i32)
    (local i32)
    block  ;; label = @1
      get_global 2
      set_local 2
      get_global 2
      i32.const 16
      i32.add
      set_global 2
      get_local 2
      get_local 0
      i32.store offset=4
      get_local 2
      get_local 1
      i32.store
      get_local 2
      set_global 2
    end)
  (func (;33;) (type 1) (param i32)
    (local i32 i32)
    block  ;; label = @1
      get_global 2
      set_local 1
      get_global 2
      i32.const 16
      i32.add
      set_global 2
      get_local 1
      tee_local 2
      get_local 0
      i32.store
      get_local 2
      i32.load
      i32.eqz
      if  ;; label = @2
        get_local 1
        set_global 2
        return
      end
      get_local 2
      i32.load
      i32.load offset=16
      call 3
      get_local 1
      set_global 2
    end)
  (func (;34;) (type 6) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      get_global 2
      set_local 3
      get_global 2
      i32.const 96
      i32.add
      set_global 2
      get_local 3
      i32.const 56
      i32.add
      tee_local 5
      get_local 0
      i32.store
      get_local 3
      i32.const 52
      i32.add
      tee_local 6
      get_local 1
      i32.store
      get_local 3
      i32.const 48
      i32.add
      tee_local 4
      get_local 2
      i32.store
      get_local 5
      i32.load
      i32.eqz
      get_local 6
      i32.load
      i32.eqz
      i32.or
      get_local 4
      i32.load
      i32.eqz
      i32.or
      if  ;; label = @2
        get_local 3
        set_global 2
        return
      end
      get_local 3
      i32.const 44
      i32.add
      tee_local 0
      get_local 5
      i32.load
      i32.load offset=16
      i32.store
      get_local 0
      i32.load
      i32.eqz
      if  ;; label = @2
        get_local 3
        set_global 2
        return
      end
      get_local 3
      i32.const 40
      i32.add
      tee_local 1
      get_local 6
      i32.load
      call 22
      i32.store
      get_local 3
      i32.const 36
      i32.add
      tee_local 29
      get_local 1
      i32.load
      get_local 0
      i32.load
      i32.load16_u
      i32.const 1
      i32.shl
      i32.add
      i32.store
      get_local 3
      i32.const 32
      i32.add
      tee_local 30
      get_local 0
      i32.load
      i32.load16_u offset=2
      if i32  ;; label = @2
        get_local 1
        i32.load
        get_local 0
        i32.load
        i32.load16_u offset=2
        i32.const 1
        i32.shl
        i32.add
      else
        get_global 0
        i32.const 512
        i32.add
      end
      tee_local 2
      i32.store
      get_local 0
      i32.load
      i32.load16_u offset=4
      if i32  ;; label = @2
        get_local 1
        i32.load
        get_local 0
        i32.load
        i32.load16_u offset=4
        i32.const 1
        i32.shl
        i32.add
      else
        get_global 0
        i32.const 1024
        i32.add
      end
      set_local 2
      get_local 3
      i32.const 20
      i32.add
      set_local 22
      get_local 3
      i32.const 16
      i32.add
      set_local 1
      get_local 3
      i32.const 12
      i32.add
      set_local 23
      get_local 3
      i32.const 8
      i32.add
      set_local 24
      get_local 3
      i32.const 74
      i32.add
      set_local 8
      get_local 3
      i32.const 72
      i32.add
      set_local 25
      get_local 3
      i32.const 70
      i32.add
      set_local 26
      get_local 3
      i32.const 68
      i32.add
      set_local 27
      get_local 3
      i32.const 66
      i32.add
      set_local 9
      get_local 3
      i32.const 64
      i32.add
      set_local 10
      get_local 3
      i32.const 83
      i32.add
      set_local 14
      get_local 3
      i32.const 82
      i32.add
      set_local 15
      get_local 3
      i32.const 81
      i32.add
      set_local 16
      get_local 3
      i32.const 80
      i32.add
      set_local 17
      get_local 3
      i32.const 79
      i32.add
      set_local 18
      get_local 3
      i32.const 78
      i32.add
      set_local 19
      get_local 3
      i32.const 77
      i32.add
      set_local 20
      get_local 3
      i32.const 76
      i32.add
      set_local 21
      get_local 3
      i32.const 4
      i32.add
      set_local 11
      get_local 3
      set_local 0
      get_local 3
      i32.const 62
      i32.add
      set_local 5
      get_local 3
      i32.const 60
      i32.add
      set_local 6
      get_local 3
      i32.const 28
      i32.add
      tee_local 28
      get_local 2
      i32.store
      get_local 3
      i32.const 24
      i32.add
      tee_local 2
      i32.const 0
      i32.store
      loop  ;; label = @2
        get_local 2
        i32.load
        i32.const 96
        i32.lt_s
        if  ;; label = @3
          get_local 22
          get_local 2
          i32.load
          i32.const 8
          i32.div_s
          i32.store
          get_local 1
          i32.const 0
          i32.store
          loop  ;; label = @4
            get_local 1
            i32.load
            i32.const 128
            i32.lt_s
            if  ;; label = @5
              get_local 23
              get_local 1
              i32.load
              i32.const 4
              i32.div_s
              i32.store
              get_local 24
              get_local 22
              i32.load
              i32.const 5
              i32.shl
              get_local 23
              i32.load
              i32.add
              i32.store
              get_local 8
              get_local 29
              i32.load
              get_local 24
              i32.load
              i32.const 1
              i32.shl
              i32.add
              i32.load16_s
              i32.store16
              get_local 25
              get_local 8
              i32.load16_u
              i32.const 12
              i32.shr_s
              i32.store16
              get_local 26
              get_local 8
              i32.load16_u
              i32.const 8
              i32.shr_s
              i32.const 15
              i32.and
              i32.store16
              get_local 27
              get_local 8
              i32.load16_u
              i32.const 127
              i32.and
              i32.store16
              get_local 9
              get_local 28
              i32.load
              get_local 25
              i32.load16_u
              i32.const 1
              i32.shl
              i32.add
              i32.load16_s
              i32.store16
              get_local 10
              get_local 28
              i32.load
              get_local 26
              i32.load16_u
              i32.const 1
              i32.shl
              i32.add
              i32.load16_s
              i32.store16
              get_local 14
              get_local 9
              i32.load16_u
              i32.const 8
              i32.shr_s
              i32.const 4
              i32.shl
              i32.store8
              get_local 15
              get_local 9
              i32.load16_u
              i32.const 4
              i32.shr_s
              i32.const 15
              i32.and
              i32.const 4
              i32.shl
              i32.store8
              get_local 16
              get_local 9
              i32.load16_u
              i32.const 15
              i32.and
              i32.const 4
              i32.shl
              i32.store8
              get_local 17
              i32.const -1
              i32.store8
              get_local 18
              get_local 10
              i32.load16_u
              i32.const 8
              i32.shr_s
              i32.const 4
              i32.shl
              i32.store8
              get_local 19
              get_local 10
              i32.load16_u
              i32.const 4
              i32.shr_s
              i32.const 15
              i32.and
              i32.const 4
              i32.shl
              i32.store8
              get_local 20
              get_local 10
              i32.load16_u
              i32.const 15
              i32.and
              i32.const 4
              i32.shl
              i32.store8
              get_local 21
              i32.const -1
              i32.store8
              get_local 11
              get_local 1
              i32.load
              i32.const 4
              i32.rem_s
              i32.store
              get_local 0
              get_local 2
              i32.load
              i32.const 8
              i32.rem_s
              i32.store
              get_local 30
              i32.load
              set_local 12
              get_local 27
              i32.load16_u
              i32.const 1
              i32.shl
              set_local 7
              get_local 11
              i32.load
              i32.const 2
              i32.lt_s
              if i32  ;; label = @6
                get_local 5
                get_local 12
                get_local 7
                i32.const 1
                i32.shl
                i32.add
                i32.load16_s
                i32.store16
                get_local 11
                i32.load
                i32.eqz
                if  ;; label = @7
                  get_local 5
                  get_local 5
                  i32.load16_u
                  i32.const 8
                  i32.shr_s
                  i32.store16
                end
                get_local 5
                get_local 5
                i32.load16_u
                get_local 0
                i32.load
                i32.shr_s
                i32.const 1
                i32.and
                i32.store16
                get_local 5
                i32.load16_s
                if i32  ;; label = @7
                  get_local 4
                  i32.load
                  get_local 2
                  i32.load
                  i32.const 7
                  i32.shl
                  get_local 1
                  i32.load
                  i32.add
                  i32.const 2
                  i32.shl
                  i32.add
                  get_local 14
                  i32.load8_s
                  i32.store8
                  get_local 4
                  i32.load
                  get_local 2
                  i32.load
                  i32.const 7
                  i32.shl
                  get_local 1
                  i32.load
                  i32.add
                  i32.const 2
                  i32.shl
                  i32.const 1
                  i32.add
                  i32.add
                  get_local 15
                  i32.load8_s
                  i32.store8
                  get_local 4
                  i32.load
                  get_local 2
                  i32.load
                  i32.const 7
                  i32.shl
                  get_local 1
                  i32.load
                  i32.add
                  i32.const 2
                  i32.shl
                  i32.const 2
                  i32.add
                  i32.add
                  get_local 16
                  i32.load8_s
                  i32.store8
                  get_local 4
                  i32.load
                  set_local 7
                  get_local 2
                  i32.load
                  i32.const 7
                  i32.shl
                  get_local 1
                  i32.load
                  i32.add
                  set_local 13
                  get_local 17
                  i32.load8_s
                else
                  get_local 4
                  i32.load
                  get_local 2
                  i32.load
                  i32.const 7
                  i32.shl
                  get_local 1
                  i32.load
                  i32.add
                  i32.const 2
                  i32.shl
                  i32.add
                  get_local 18
                  i32.load8_s
                  i32.store8
                  get_local 4
                  i32.load
                  get_local 2
                  i32.load
                  i32.const 7
                  i32.shl
                  get_local 1
                  i32.load
                  i32.add
                  i32.const 2
                  i32.shl
                  i32.const 1
                  i32.add
                  i32.add
                  get_local 19
                  i32.load8_s
                  i32.store8
                  get_local 4
                  i32.load
                  get_local 2
                  i32.load
                  i32.const 7
                  i32.shl
                  get_local 1
                  i32.load
                  i32.add
                  i32.const 2
                  i32.shl
                  i32.const 2
                  i32.add
                  i32.add
                  get_local 20
                  i32.load8_s
                  i32.store8
                  get_local 4
                  i32.load
                  set_local 7
                  get_local 2
                  i32.load
                  i32.const 7
                  i32.shl
                  get_local 1
                  i32.load
                  i32.add
                  set_local 13
                  get_local 21
                  i32.load8_s
                end
              else
                get_local 6
                get_local 12
                get_local 7
                i32.const 1
                i32.add
                i32.const 1
                i32.shl
                i32.add
                i32.load16_s
                i32.store16
                get_local 11
                i32.load
                i32.const 2
                i32.eq
                if  ;; label = @7
                  get_local 6
                  get_local 6
                  i32.load16_u
                  i32.const 8
                  i32.shr_s
                  i32.store16
                end
                get_local 6
                get_local 6
                i32.load16_u
                get_local 0
                i32.load
                i32.shr_s
                i32.const 1
                i32.and
                i32.store16
                get_local 6
                i32.load16_s
                if i32  ;; label = @7
                  get_local 4
                  i32.load
                  get_local 2
                  i32.load
                  i32.const 7
                  i32.shl
                  get_local 1
                  i32.load
                  i32.add
                  i32.const 2
                  i32.shl
                  i32.add
                  get_local 14
                  i32.load8_s
                  i32.store8
                  get_local 4
                  i32.load
                  get_local 2
                  i32.load
                  i32.const 7
                  i32.shl
                  get_local 1
                  i32.load
                  i32.add
                  i32.const 2
                  i32.shl
                  i32.const 1
                  i32.add
                  i32.add
                  get_local 15
                  i32.load8_s
                  i32.store8
                  get_local 4
                  i32.load
                  get_local 2
                  i32.load
                  i32.const 7
                  i32.shl
                  get_local 1
                  i32.load
                  i32.add
                  i32.const 2
                  i32.shl
                  i32.const 2
                  i32.add
                  i32.add
                  get_local 16
                  i32.load8_s
                  i32.store8
                  get_local 4
                  i32.load
                  set_local 7
                  get_local 2
                  i32.load
                  i32.const 7
                  i32.shl
                  get_local 1
                  i32.load
                  i32.add
                  set_local 13
                  get_local 17
                  i32.load8_s
                else
                  get_local 4
                  i32.load
                  get_local 2
                  i32.load
                  i32.const 7
                  i32.shl
                  get_local 1
                  i32.load
                  i32.add
                  i32.const 2
                  i32.shl
                  i32.add
                  get_local 18
                  i32.load8_s
                  i32.store8
                  get_local 4
                  i32.load
                  get_local 2
                  i32.load
                  i32.const 7
                  i32.shl
                  get_local 1
                  i32.load
                  i32.add
                  i32.const 2
                  i32.shl
                  i32.const 1
                  i32.add
                  i32.add
                  get_local 19
                  i32.load8_s
                  i32.store8
                  get_local 4
                  i32.load
                  get_local 2
                  i32.load
                  i32.const 7
                  i32.shl
                  get_local 1
                  i32.load
                  i32.add
                  i32.const 2
                  i32.shl
                  i32.const 2
                  i32.add
                  i32.add
                  get_local 20
                  i32.load8_s
                  i32.store8
                  get_local 4
                  i32.load
                  set_local 7
                  get_local 2
                  i32.load
                  i32.const 7
                  i32.shl
                  get_local 1
                  i32.load
                  i32.add
                  set_local 13
                  get_local 21
                  i32.load8_s
                end
              end
              set_local 12
              get_local 7
              get_local 13
              i32.const 2
              i32.shl
              i32.const 3
              i32.add
              i32.add
              get_local 12
              i32.store8
              get_local 1
              get_local 1
              i32.load
              i32.const 1
              i32.add
              i32.store
              br 1 (;@4;)
            end
          end
          get_local 2
          get_local 2
          i32.load
          i32.const 1
          i32.add
          i32.store
          br 1 (;@2;)
        end
      end
      get_local 3
      set_global 2
    end)
  (func (;35;) (type 7)
    nop)
  (func (;36;) (type 7)
    block  ;; label = @1
      get_global 0
      i32.const 1056
      i32.add
      set_global 2
      get_global 2
      i32.const 5242880
      i32.add
      set_global 3
      call 35
    end)
  (func (;37;) (type 8) (result f64)
    block f64  ;; label = @1
      i32.const 0
      call 0
      f64.const 0x0p+0 (;=0;)
    end)
  (global (;2;) (mut i32) (i32.const 0))
  (global (;3;) (mut i32) (i32.const 0))
  (export "_dcpu_set_register" (func 20))
  (export "__post_instantiate" (func 36))
  (export "_dcpu_process" (func 19))
  (export "_interrupt_queue_empty" (func 28))
  (export "_tick_handler" (func 32))
  (export "_dcpu_power_off" (func 10))
  (export "_dcpu_attach" (func 12))
  (export "_dcpu_interrupt" (func 18))
  (export "_lem1802_initialize" (func 29))
  (export "_dcpu_power_on" (func 9))
  (export "_dcpu_flash" (func 11))
  (export "_dcpu_memory" (func 22))
  (export "_destroy_handler" (func 33))
  (export "_interrupt_queue_pop" (func 27))
  (export "runPostSets" (func 35))
  (export "_dcpu_get_register" (func 21))
  (export "_dcpu_create" (func 6))
  (export "_dcpu_cycle" (func 13))
  (export "_dcpu_destroy" (func 8))
  (export "_interrupt_queue_reset" (func 25))
  (export "_interrupt_queue_destroy" (func 24))
  (export "_dcpu_reset" (func 7))
  (export "_lem1802_write_texture" (func 34))
  (export "_interrupt_queue_create" (func 23))
  (export "_hwi_handler" (func 31))
  (export "_hwq_handler" (func 30))
  (export "_interrupt_queue_push" (func 26))
  (elem (get_global 1) 37 30 31 32 33 37 37 37)
  (data (get_global 0) "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\03\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\04\00\00\00\01\00\00\00\01\00\00\00\03\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\04\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\02\00\00\00\02\00\00\00\02\00\00\00\02\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\02\00\00\00\02\00\00\00\02\00\00\00\02\00\00\00\02\00\00\00\02\00\00\00\02\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\03\00\00\00\03\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\02\00\00\00\0f\00\08\08\0f\08\08\08\f8\08\08\08\ff\00\08\08\08\08\08\08\ff\08\08\08\ff\00\14\14\00\ff\08\ff\10\1f\14\17\04\fc\14\f4\10\17\14\17\04\f4\14\f4\00\ff\14\f7\14\14\14\14\00\f7\14\f7\17\14\14\14\08\0f\08\0f\f4\14\14\14\08\f8\08\f8\08\0f\08\0f\1f\00\14\14\fc\00\14\14\08\f8\08\f8\08\ff\08\ff\ff\14\14\14\0f\08\00\00\f8\00\08\08\ff\ff\ff\ff\f0\f0\f0\f0\ff\ff\00\00\00\00\ff\ff\0f\0f\0f\0f\00\00\00\00_\00\00\00\00\03\00\03\14>\00>k&\002\1ca\00C)6Pv\02\00\00\01\22\1c\00A\22A\00\1c\1c*\00*>\08\00\08 @\00\00\08\08\00\08@\00\00\00\1c`\00\03A>\00>\7fB\00@Yb\00FI\22\006\08\0f\00\7fE'\009I>\002\19a\00\07I6\006I&\00>$\00\00\00$@\00\00\14\08A\22\14\14\00\14\22A\08\14Y\02\00\06Y>\00^\09~\00~I\7f\006A>\00\22A\7f\00>I\7f\00A\09\7f\00\01I>\00:\08\7f\00\7f\7fA\00A@ \00?\0c\7f\00s@\7f\00@\06\7f\00\7f\01\7f\00~A>\00>\09\7f\00\06A>\00\be\09\7f\00vI&\002\7f\01\00\01@\7f\00\7f`\1f\00\1f0\7f\00\7f\08w\00wx\07\00\07Iq\00G\7f\00\00A\1c\03\00`A\00\00\7f\01\02\00\02\80\80\00\80\01\00\00\02T$\00xD\7f\008D8\00(D8\00\7fT8\00X~\08\00\09TH\00<\04\7f\00x}D\00@@ \00=\10\7f\00l\7fA\00@\18|\00|\04|\00xD8\008\14|\00\08\14\08\00|\04|\00\08TH\00$>\04\00D@<\00|`\1c\00\1c0|\00|\10l\00lPL\00<Td\00L6\08\00Aw\00\00\006A\00\08\01\02\01\02Lp\00p\00\00\0a\00\a0\00\aa\00\00\0a\0a\0aP\0a\aa\0aU\05_\05\f5\05\ff\05U\0f_\0f\f5\0f\ff\0f"))

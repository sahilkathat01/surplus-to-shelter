<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content="Surplus-to-Shelter — a real-time algorithmic food rescue engine. Log surplus in under a minute, watch live ESG impact, dispatch volunteer drivers." />
  <meta name="theme-color" content="#F5F0E6" />
  <title>Surplus-to-Shelter | Real-Time Food Rescue Command Center</title>

  <!-- ================= GOOGLE FONTS ================= -->
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link
    href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=JetBrains+Mono:wght@400;500;700&family=Newsreader:ital,opsz,wght@0,6..72,400;0,6..72,500;0,6..72,600;0,6..72,700;1,6..72,400&family=Playfair+Display:wght@600;700&display=swap"
    rel="stylesheet"
  />

  <!-- ================= TAILWIND CSS CDN ================= -->
  <script src="https://cdn.tailwindcss.com"></script>
  <script>
    tailwind.config = {
      theme: {
        extend: {
          colors: {
            /* Vintage-editorial palette (from pitch deck) */
            cream: '#F5F0E6',          /* canvas / background   */
            paper: '#FAF7F0',          /* card surface          */
            sand: { DEFAULT: '#DCD3C1', deep: '#D5CCA8' }, /* borders */
            forest: { DEFAULT: '#163323', 700: '#1E3F2E', 800: '#122A1D' }, /* dark primary */
            rust: { DEFAULT: '#C84B31', alt: '#D9532F' }   /* urgency accent */
          },
          fontFamily: {
            sans: ['Inter', 'ui-sans-serif', 'system-ui', 'sans-serif'],
            serif: ['Newsreader', 'Playfair Display', 'Georgia', 'serif'],
            display: ['"Playfair Display"', 'Newsreader', 'Georgia', 'serif'],
            mono: ['"JetBrains Mono"', 'ui-monospace', 'SFMono-Regular', 'monospace']
          },
          boxShadow: {
            card: '0 18px 40px -30px rgba(18, 42, 29, 0.65)',
            lift: '0 20px 45px -28px rgba(18, 42, 29, 0.55)'
          }
        }
      },
      /* Classes injected at runtime by the renderer */
      safelist: [
        'bg-red-100', 'border-red-500', 'border-2', 'text-red-700',
        'bg-paper', 'border-sand', 'border-forest/15',
        'bg-forest', 'text-cream', 'hover:bg-rust', 'hover:bg-forest',
        'bg-rust', 'text-white', 'border-rust', 'text-rust',
        'bg-amber-100', 'text-amber-800', 'border-amber-300',
        'bg-emerald-100', 'text-emerald-800', 'border-emerald-300',
        'bg-emerald-600', 'text-emerald-700', 'border-emerald-300',
        'text-forest/45', 'text-forest/50', 'text-forest/60'
      ]
    };
  </script>

  <style>
    /* ===========================================================
       SURPLUS-TO-SHELTER · editorial primitives
       (palette-critical form/toast/animation styling)
       =========================================================== */
    :root { color-scheme: light; }

    body {
      background-color: #F5F0E6;
      background-image:
        radial-gradient(1100px 520px at 88% -12%, rgba(200, 75, 49, 0.055), transparent 60%),
        radial-gradient(900px 520px at -8% 110%, rgba(22, 51, 35, 0.06), transparent 62%);
    }

    /* Faint command-center grid on the matrix canvas */
    .paper-grid {
      background-image:
        linear-gradient(rgba(22, 51, 35, 0.035) 1px, transparent 1px),
        linear-gradient(90deg, rgba(22, 51, 35, 0.035) 1px, transparent 1px);
      background-size: 46px 46px;
      background-position: -1px -1px;
    }

    /* Form fields */
    .field {
      width: 100%;
      min-width: 0;
      background: #FFFFFF;
      border: 1px solid #DCD3C1;
      border-radius: 10px;
      padding: 0.72rem 0.85rem;
      font-size: 0.925rem;
      font-weight: 500;
      color: #163323;
      font-family: 'Inter', sans-serif;
      transition: border-color 0.18s ease, box-shadow 0.18s ease;
    }
    .field::placeholder { color: rgba(22, 51, 35, 0.34); font-weight: 400; }
    .field:focus {
      outline: none;
      border-color: #163323;
      box-shadow: 0 0 0 3px rgba(22, 51, 35, 0.14);
    }
    .field.is-invalid { border-color: #C84B31; box-shadow: 0 0 0 3px rgba(200, 75, 49, 0.16); }
    input[type="number"] { -moz-appearance: textfield; appearance: textfield; }
    input[type="number"]::-webkit-outer-spin-button,
    input[type="number"]::-webkit-inner-spin-button { -webkit-appearance: none; margin: 0; }

    /* Urgent card halo — colour itself comes from Tailwind utilities */
    @keyframes urgentHalo {
      0%, 100% { box-shadow: 0 0 0 0 rgba(200, 75, 49, 0.30); }
      50%      { box-shadow: 0 0 0 6px rgba(200, 75, 49, 0); }
    }
    .is-urgent { animation: urgentHalo 2.6s ease-in-out infinite; }

    /* Card entrance (only new records animate) */
    @keyframes cardIn { from { opacity: 0; transform: translateY(10px); } to { opacity: 1; transform: none; } }
    .card-enter { animation: cardIn 0.34s cubic-bezier(0.16, 1, 0.3, 1) both; }

    /* Toasts */
    @keyframes toastIn { from { opacity: 0; transform: translateX(24px); } to { opacity: 1; transform: none; } }
    @keyframes toastOut { to { opacity: 0; transform: translateX(24px); } }
    .sss-toast {
      position: relative;
      display: flex;
      gap: 0;
      width: 336px;
      overflow: hidden;
      background: #FAF7F0;
      border: 1px solid #DCD3C1;
      border-radius: 12px;
      box-shadow: 0 24px 55px -30px rgba(18, 42, 29, 0.75);
      animation: toastIn 0.3s cubic-bezier(0.16, 1, 0.3, 1) both;
      font-family: 'Inter', sans-serif;
    }
    .sss-toast.is-leaving { animation: toastOut 0.25s ease forwards; }
    .sss-toast__bar { width: 5px; flex: none; background: #163323; }
    .sss-toast--error .sss-toast__bar { background: #C84B31; }
    .sss-toast--info .sss-toast__bar { background: #D9532F; }
    .sss-toast__body { padding: 0.8rem 0.85rem; flex: 1; }
    .sss-toast__title { font-size: 12.5px; font-weight: 700; color: #163323; letter-spacing: -0.01em; }
    .sss-toast__text { font-size: 12px; color: #5C6657; margin-top: 2px; line-height: 1.45; }
    .sss-toast__close {
      align-self: flex-start;
      margin: 0.55rem 0.6rem 0 0;
      width: 22px; height: 22px;
      border-radius: 999px;
      border: 1px solid #DCD3C1;
      background: transparent;
      color: #163323;
      font-size: 13px; line-height: 1;
      cursor: pointer;
    }
    .sss-toast__close:hover { background: #F5F0E6; }

    /* Scrollbars */
    .rail::-webkit-scrollbar { width: 8px; }
    .rail::-webkit-scrollbar-thumb { background: rgba(245, 240, 230, 0.22); border-radius: 999px; }
    .rail::-webkit-scrollbar-track { background: transparent; }

    @media (prefers-reduced-motion: reduce) {
      .is-urgent, .card-enter, .sss-toast { animation: none !important; }
      * { transition-duration: 0.01ms !important; }
    }

    @media print {
      .no-print { display: none !important; }
    }
  </style>
</head>

<body class="min-h-screen font-sans text-forest antialiased selection:bg-rust/20">

  <noscript>
    <div style="padding:24px;font-family:sans-serif;background:#F5F0E6;color:#163323">
      Surplus-to-Shelter requires JavaScript to run the live rescue pipeline.
    </div>
  </noscript>

  <!-- ============================================================
       A. HEADER
       ============================================================ -->
  <header class="no-print sticky top-0 z-40 border-b border-sand bg-cream/95 backdrop-blur-sm">
    <div class="mx-auto flex w-full max-w-[1680px] flex-wrap items-end justify-between gap-4 px-5 py-4 lg:px-8">
      <div class="flex items-end gap-3.5">
        <div class="grid h-11 w-11 shrink-0 place-items-center rounded-md bg-forest font-display text-xl font-bold text-cream shadow-card">S</div>
        <div>
          <h1 class="font-display text-[26px] font-bold leading-none tracking-tight text-forest sm:text-[30px]">
            Surplus-to-Shelter
          </h1>
          <p class="mt-2 font-mono text-[10px] uppercase tracking-[0.22em] text-forest/60">
            Real-time algorithmic food rescue engine
          </p>
        </div>
      </div>

      <div class="flex flex-wrap items-center gap-2">
        <!-- Sync mode chip -->
        <span id="modeChip"
              class="inline-flex items-center gap-2 rounded-full border border-sand bg-paper px-3.5 py-1.5 font-mono text-[10px] uppercase tracking-[0.16em] text-forest/70">
          <span id="modeDot" class="h-1.5 w-1.5 animate-pulse rounded-full bg-forest/50"></span>
          <span id="modeLabel">Syncing…</span>
        </span>
        <!-- Right side badges (per spec) -->
        <span class="rounded-full bg-forest px-3.5 py-1.5 font-mono text-[10px] uppercase tracking-[0.16em] text-cream">
          JAIPUR · PILOT RUN
        </span>
        <span class="rounded-full border border-rust px-3.5 py-1.5 font-mono text-[10px] uppercase tracking-[0.16em] text-rust">
          Track A · NGO Impact
        </span>
      </div>
    </div>
  </header>

  <!-- Mode banner (visible only in local fallback) -->
  <div id="modeBanner" class="no-print hidden border-b border-amber-300 bg-amber-50">
    <div class="mx-auto flex w-full max-w-[1680px] flex-wrap items-center justify-between gap-3 px-5 py-2.5 lg:px-8">
      <p id="modeBannerText" class="font-mono text-[11px] leading-relaxed text-amber-900">⚠ LOCAL DEMO MODE</p>
      <button id="reconnectBtn" type="button"
              class="rounded-full border border-amber-400 px-3 py-1 font-mono text-[10px] uppercase tracking-[0.14em] text-amber-900 transition hover:bg-amber-100">
        ↻ Retry live connection
      </button>
    </div>
  </div>

  <!-- ============================================================
       12-COLUMN COMMAND CENTER
       ============================================================ -->
  <main class="grid w-full grid-cols-1 xl:grid-cols-12">

    <!-- ------------------------------------------------------
         B. LEFT COLUMN (Col-4) · Frictionless Intake + ESG
         ------------------------------------------------------ -->
    <aside class="relative min-w-0 overflow-hidden bg-forest text-cream xl:col-span-4">
      <!-- decorative rings -->
      <div class="pointer-events-none absolute -right-24 -top-24 h-72 w-72 rounded-full border border-white/10"></div>
      <div class="pointer-events-none absolute -right-10 -top-10 h-44 w-44 rounded-full border border-rust/40"></div>
      <div class="pointer-events-none absolute inset-x-0 top-0 h-px bg-gradient-to-r from-rust/0 via-rust/70 to-rust/0"></div>

      <div class="rail flex flex-col gap-5 px-5 py-6 lg:px-7 xl:sticky xl:top-[77px] xl:max-h-[calc(100vh-77px)] xl:overflow-y-auto">
        <div>
          <p class="font-mono text-[10px] uppercase tracking-[0.24em] text-rust">Step 01 · Frictionless Intake</p>
          <h2 class="mt-2 font-serif text-[27px] font-semibold leading-[1.15] text-cream">
            Turn surplus into a shelter meal in&nbsp;under 60 seconds.
          </h2>
          <p class="mt-2 text-[13.5px] leading-relaxed text-cream/60">
            Food item → quantity → shelf life. Everything else — impact math, urgency triage and
            dispatch — happens the moment you log it.
          </p>
        </div>

        <!-- Intake + Live ESG card -->
        <form id="intakeForm" novalidate
              class="rounded-xl border border-sand bg-paper p-5 shadow-lift text-forest">
          <div class="flex items-center justify-between border-b border-sand pb-3">
            <span class="font-mono text-[10px] uppercase tracking-[0.2em] text-forest/50">Rescue intake form</span>
            <span class="rounded border border-rust px-2 py-0.5 font-mono text-[9.5px] uppercase tracking-[0.12em] text-rust">
              ≤ 60 sec
            </span>
          </div>

          <!-- Input 1: Food item -->
          <div class="mt-4">
            <label for="itemInput" class="mb-1.5 block font-mono text-[10px] uppercase tracking-[0.18em] text-forest/60">
              Food Item Name
            </label>
            <input id="itemInput" name="item" type="text" class="field" autocomplete="off"
                   placeholder="40kg Paneer &amp; Dal" aria-describedby="formError" />
          </div>

          <!-- Inputs 2 + 3: quantity & shelf life -->
          <div class="mt-4 grid grid-cols-2 gap-3">
            <div class="min-w-0">
              <label for="qtyInput" class="mb-1.5 block font-mono text-[10px] uppercase tracking-[0.18em] text-forest/60">
                Quantity in KG
              </label>
              <input id="qtyInput" name="qty" type="number" min="0.1" step="0.1" class="field" placeholder="40"
                     inputmode="decimal" aria-describedby="formError" />
            </div>
            <div class="min-w-0">
              <label for="expiryInput" class="mb-1.5 block font-mono text-[10px] uppercase tracking-[0.18em] text-forest/60">
                Shelf-Life in Hours
              </label>
              <input id="expiryInput" name="expiry" type="number" min="0" step="0.5" class="field" placeholder="4"
                     inputmode="decimal" aria-describedby="formError" />
            </div>
          </div>

          <p id="formError" role="alert"
             class="mt-2.5 hidden rounded-md border border-red-300 bg-red-50 px-3 py-2 font-mono text-[10.5px] leading-snug text-red-700"></p>

          <!-- Live ESG calculator -->
          <div class="mt-4 rounded-lg border border-sand bg-cream/70 p-4" aria-label="Live ESG impact calculator">
            <div class="flex items-center justify-between">
              <span class="font-mono text-[10px] uppercase tracking-[0.2em] text-forest/55">Live ESG impact</span>
              <span class="rounded-full border border-sand bg-paper px-2 py-0.5 font-mono text-[9px] uppercase tracking-[0.12em] text-forest/50">
                Auto-calculated
              </span>
            </div>

            <dl class="mt-3.5 space-y-2.5" aria-live="polite">
              <div class="flex items-end justify-between gap-3 border-b border-dashed border-sand pb-2.5">
                <dt class="font-mono text-[10px] uppercase leading-tight tracking-[0.14em] text-forest/60">
                  Meals Served
                  <span class="mt-0.5 block font-sans text-[10.5px] normal-case tracking-normal text-forest/45">Qty × 3</span>
                </dt>
                <dd id="esgMeals" class="font-serif text-[27px] font-semibold leading-none text-forest">0</dd>
              </div>

              <div class="flex items-end justify-between gap-3 border-b border-dashed border-sand pb-2.5">
                <dt class="font-mono text-[10px] uppercase leading-tight tracking-[0.14em] text-forest/60">
                  CO2e Diverted
                  <span class="mt-0.5 block font-sans text-[10.5px] normal-case tracking-normal text-forest/45">Qty × 2.5 kg</span>
                </dt>
                <dd id="esgCo2" class="font-serif text-[27px] font-semibold leading-none text-forest">0.0 kg</dd>
              </div>

              <div class="flex items-end justify-between gap-3">
                <dt class="font-mono text-[10px] uppercase leading-tight tracking-[0.14em] text-forest/60">
                  Sec 80G Tax Credit
                  <span class="mt-0.5 block font-sans text-[10.5px] normal-case tracking-normal text-forest/45">Qty × ₹20</span>
                </dt>
                <dd id="esgTax" class="font-serif text-[27px] font-semibold leading-none text-rust">₹0</dd>
              </div>
            </dl>
          </div>

          <!-- Submit -->
          <button id="submitBtn" type="submit"
                  class="mt-4 flex w-full items-center justify-center gap-2 rounded-lg bg-forest px-5 py-3.5 text-[14.5px] font-semibold tracking-tight text-cream transition hover:bg-forest-700 focus:outline-none focus-visible:ring-2 focus-visible:ring-rust focus-visible:ring-offset-2 focus-visible:ring-offset-paper active:translate-y-px">
            Log Rescue &amp; Dispatch
            <span aria-hidden="true">→</span>
          </button>

          <p class="mt-3 text-center font-mono text-[9.5px] leading-relaxed text-forest/45">
            Firestore collection <span class="text-forest/70">“donations”</span> · status
            <span class="text-forest/70">PENDING</span> · server timestamp · no page reload
          </p>
        </form>

        <!-- Demo helper -->
        <button id="demoFillBtn" type="button"
                class="rounded-lg border border-white/15 px-4 py-2.5 text-left font-mono text-[11px] uppercase tracking-[0.14em] text-cream/70 transition hover:border-rust/60 hover:text-cream">
          ⚡ Load quick demo batch
        </button>

        <div class="flex items-start gap-2.5 border-t border-white/10 pt-4 font-mono text-[10.5px] leading-relaxed text-cream/55">
          <span class="mt-1.5 h-1.5 w-1.5 shrink-0 animate-pulse rounded-full bg-rust"></span>
          <p>
            Urgency lane — any batch with a shelf-life of
            <span class="text-cream">≤ 2 hours</span> is automatically flagged
            <span class="text-rust">⚠ URGENT</span> and pinned to the top of triage.
          </p>
        </div>
      </div>
    </aside>

    <!-- ------------------------------------------------------
         C. RIGHT COLUMN (Col-8) · Live Rescue & Triage Matrix
         ------------------------------------------------------ -->
    <section class="paper-grid min-w-0 bg-cream px-5 py-6 lg:px-8 xl:col-span-8">

      <!-- Matrix header + active item counter -->
      <div class="flex flex-wrap items-end justify-between gap-4">
        <div>
          <p class="font-mono text-[10px] uppercase tracking-[0.24em] text-rust">Step 02 · Live Dispatch Matrix</p>
          <h2 class="mt-2 font-serif text-[30px] font-semibold leading-none tracking-tight text-forest">
            Active Rescue Pipeline
          </h2>
          <p class="mt-2 font-mono text-[10.5px] uppercase tracking-[0.14em] text-forest/50">
            Auto-refreshed via Firestore onSnapshot · local fallback when offline
          </p>
        </div>

        <div class="flex flex-wrap items-center gap-2">
          <span id="activeCounter"
                class="rounded-full bg-forest px-3.5 py-1.5 font-mono text-[11px] font-bold tracking-[0.1em] text-cream">
            0 ACTIVE
          </span>
          <span id="dispatchedCounter"
                class="rounded-full border border-sand bg-paper px-3.5 py-1.5 font-mono text-[11px] font-bold tracking-[0.1em] text-forest/70">
            0 DISPATCHED
          </span>
        </div>
      </div>

      <!-- Impact statistics -->
      <div class="mt-5 grid grid-cols-2 gap-3 sm:grid-cols-3 lg:grid-cols-5">
        <div class="rounded-xl border border-sand bg-paper px-4 py-3.5 shadow-card">
          <p class="font-mono text-[9.5px] uppercase tracking-[0.16em] text-forest/50">Batches</p>
          <p id="statBatches" class="mt-1.5 font-serif text-[26px] font-semibold leading-none text-forest">0</p>
        </div>
        <div class="rounded-xl border border-sand bg-paper px-4 py-3.5 shadow-card">
          <p class="font-mono text-[9.5px] uppercase tracking-[0.16em] text-forest/50">Food rescued</p>
          <p id="statKg" class="mt-1.5 font-serif text-[26px] font-semibold leading-none text-forest">0<span class="ml-1 font-mono text-[11px] font-medium text-forest/50">kg</span></p>
        </div>
        <div class="rounded-xl border border-sand bg-paper px-4 py-3.5 shadow-card">
          <p class="font-mono text-[9.5px] uppercase tracking-[0.16em] text-forest/50">Meals served</p>
          <p id="statMeals" class="mt-1.5 font-serif text-[26px] font-semibold leading-none text-forest">0</p>
        </div>
        <div class="rounded-xl border border-sand bg-paper px-4 py-3.5 shadow-card">
          <p class="font-mono text-[9.5px] uppercase tracking-[0.16em] text-forest/50">Urgent queue</p>
          <p id="statUrgent" class="mt-1.5 font-serif text-[26px] font-semibold leading-none text-forest">0</p>
        </div>
        <div class="rounded-xl border border-sand bg-paper px-4 py-3.5 shadow-card">
          <p class="font-mono text-[9.5px] uppercase tracking-[0.16em] text-forest/50">Dispatched</p>
          <p id="statDispatched" class="mt-1.5 font-serif text-[26px] font-semibold leading-none text-forest">0</p>
        </div>
      </div>

      <!-- Card grid -->
      <div id="cardsGrid" class="mt-5 grid grid-cols-1 gap-4 md:grid-cols-2" aria-live="polite" aria-label="Active rescue cards"></div>

      <!-- Empty state -->
      <div id="emptyState" class="mt-5 hidden rounded-xl border border-dashed border-sand-deep bg-paper/60 px-6 py-14 text-center">
        <div class="mx-auto grid h-12 w-12 place-items-center rounded-full border border-sand bg-cream font-serif text-xl text-forest/50">→</div>
        <p class="mt-4 font-serif text-[20px] italic text-forest">The pipeline is clear.</p>
        <p class="mt-1.5 font-mono text-[11px] uppercase tracking-[0.14em] text-forest/50">
          Log a surplus batch on the left to start a rescue.
        </p>
      </div>

      <!-- Legend -->
      <div class="mt-5 flex flex-wrap items-center gap-x-5 gap-y-2 font-mono text-[10px] uppercase tracking-[0.12em] text-forest/45">
        <span class="inline-flex items-center gap-1.5">
          <span class="h-2 w-2 rounded-full bg-red-500"></span> ⚠ Urgent = shelf-life ≤ 2 hrs
        </span>
        <span class="inline-flex items-center gap-1.5">
          <span class="h-2 w-2 rounded-full bg-amber-400"></span> Pending
        </span>
        <span class="inline-flex items-center gap-1.5">
          <span class="h-2 w-2 rounded-full bg-emerald-500"></span> Dispatched · driver en-route
        </span>
        <span class="ml-auto">Max single shelter slot: 50 kg</span>
      </div>
    </section>
  </main>

  <!-- Footer -->
  <footer class="no-print border-t border-sand bg-cream px-5 py-4 lg:px-8">
    <div class="mx-auto flex w-full max-w-[1680px] flex-wrap items-center justify-between gap-2 font-mono text-[10px] uppercase tracking-[0.14em] text-forest/50">
      <span>Surplus-to-Shelter · Track A · NGO Impact · Jaipur Pilot</span>
      <span id="footerMode">Boot sequence…</span>
      <span>Firebase Firestore v10 · Tailwind CDN · Vanilla ES6 modules</span>
    </div>
  </footer>

  <!-- Toast stack -->
  <div id="toastStack" class="no-print fixed right-5 top-[92px] z-50 flex flex-col gap-2.5" aria-live="polite"></div>

  <!-- ============================================================
       APPLICATION CORE — Vanilla ES6 Modules
       1. Firebase config · 2. State · 3. Utils · 4. ESG calc
       5. Rendering · 6. Intake · 7. Dispatch · 8. Realtime · 9. Boot
       ============================================================ -->
  <script type="module">
    /* ------------------------------------------------------------
       1. FIREBASE CONFIGURATION  (clearly visible, top of script)
       Leave the placeholders as-is — or blank the block — and the
       app boots straight into local demo mode with seeded records.
       ------------------------------------------------------------ */
    const firebaseConfig = {
      apiKey: "YOUR_API_KEY",
      authDomain: "YOUR_PROJECT.firebaseapp.com",
      projectId: "YOUR_PROJECT_ID",
      storageBucket: "YOUR_PROJECT.appspot.com",
      messagingSenderId: "XXXX",
      appId: "XXXX"
    };

    const FIREBASE_CDN = "https://www.gstatic.com/firebasejs/10.12.2";
    const COLLECTION = "donations";
    const URGENT_MAX_HOURS = 2;

    /* ------------------------------------------------------------
       2. STATE
       ------------------------------------------------------------ */
    const state = {
      mode: "demo",        // "demo" | "firestore"
      db: null,
      unsub: null,
      donations: [],
      reason: "",
      seenIds: new Set(),
      F: null              // Firestore function bundle
    };

    const hasRealConfig = (cfg) =>
      Boolean(cfg && typeof cfg.apiKey === "string" && typeof cfg.projectId === "string") &&
      cfg.apiKey.length > 4 && !cfg.apiKey.startsWith("YOUR_") &&
      cfg.projectId.length > 2 && !cfg.projectId.startsWith("YOUR_");

    /* ------------------------------------------------------------
       3. DOM REFERENCES
       ------------------------------------------------------------ */
    const $ = (sel) => document.querySelector(sel);
    const dom = {
      form: $("#intakeForm"),
      item: $("#itemInput"),
      qty: $("#qtyInput"),
      expiry: $("#expiryInput"),
      error: $("#formError"),
      submit: $("#submitBtn"),
      demoFill: $("#demoFillBtn"),
      esgMeals: $("#esgMeals"),
      esgCo2: $("#esgCo2"),
      esgTax: $("#esgTax"),
      grid: $("#cardsGrid"),
      empty: $("#emptyState"),
      activeCounter: $("#activeCounter"),
      dispatchedCounter: $("#dispatchedCounter"),
      statBatches: $("#statBatches"),
      statKg: $("#statKg"),
      statMeals: $("#statMeals"),
      statUrgent: $("#statUrgent"),
      statDispatched: $("#statDispatched"),
      modeChip: $("#modeChip"),
      modeDot: $("#modeDot"),
      modeLabel: $("#modeLabel"),
      banner: $("#modeBanner"),
      bannerText: $("#modeBannerText"),
      reconnect: $("#reconnectBtn"),
      footerMode: $("#footerMode"),
      toasts: $("#toastStack")
    };

    /* ------------------------------------------------------------
       4. UTILITIES
       ------------------------------------------------------------ */
    const inr = new Intl.NumberFormat("en-IN");

    function escapeHTML(value) {
      return String(value ?? "").replace(/[&<>"']/g, (c) => (
        { "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" }[c]
      ));
    }

    const toNum = (v) => {
      const n = typeof v === "number" ? v : parseFloat(v);
      return Number.isFinite(n) ? n : 0;
    };

    const fmtKg = (n) => (Math.round(n * 10) / 10).toLocaleString("en-IN");

    function relTime(ms) {
      const diff = Date.now() - ms;
      if (!Number.isFinite(ms) || ms === 0) return "just now";
      if (diff < 60_000) return "just now";
      const mins = Math.floor(diff / 60_000);
      if (mins < 60) return `${mins}m ago`;
      const hrs = Math.floor(mins / 60);
      if (hrs < 24) return `${hrs}h ago`;
      return `${Math.floor(hrs / 24)}d ago`;
    }

    /* Firestore Timestamp | local ms | missing → epoch ms */
    function createdMs(rec) {
      const c = rec.createdAt;
      if (c && typeof c.toMillis === "function") return c.toMillis();
      if (c && typeof c === "object" && Number.isFinite(c.seconds)) return c.seconds * 1000;
      if (Number.isFinite(rec.createdAtMs)) return rec.createdAtMs;
      return 0;
    }

    /* Stable 4-char batch code (#4F2A) for any record id */
    function batchCode(rec) {
      if (rec.code) return rec.code;
      const seed = `${rec.id || ""}${rec.item || ""}${rec.qty || ""}`;
      let hash = 0;
      for (let i = 0; i < seed.length; i++) hash = (hash * 31 + seed.charCodeAt(i)) >>> 0;
      return `#${hash.toString(16).toUpperCase().padStart(4, "0").slice(-4)}`;
    }

    function toast(title, body, tone = "success") {
      const el = document.createElement("div");
      el.className = `sss-toast sss-toast--${tone}`;
      el.setAttribute("role", tone === "error" ? "alert" : "status");
      el.innerHTML = `
        <span class="sss-toast__bar" aria-hidden="true"></span>
        <div class="sss-toast__body">
          <p class="sss-toast__title">${escapeHTML(title)}</p>
          <p class="sss-toast__text">${body}</p>
        </div>
        <button class="sss-toast__close" type="button" aria-label="Dismiss notification">×</button>`;
      dom.toasts.appendChild(el);

      const remove = () => {
        if (!el.isConnected) return;
        el.classList.add("is-leaving");
        el.addEventListener("animationend", () => el.remove(), { once: true });
      };
      el.querySelector(".sss-toast__close").addEventListener("click", remove);
      setTimeout(remove, 4600);
      while (dom.toasts.children.length > 4) dom.toasts.firstElementChild.remove();
    }

    /* ------------------------------------------------------------
       5. LIVE ESG CALCULATOR  (Qty · 3 meals / 2.5 kg / ₹20)
       ------------------------------------------------------------ */
    function computeEsg(qty) {
      return {
        meals: Math.round(qty * 3),
        co2: (qty * 2.5).toFixed(1),
        tax: Math.round(qty * 20)
      };
    }

    function syncEsg() {
      const qty = parseFloat(dom.qty.value);
      const valid = Number.isFinite(qty) && qty > 0;
      const { meals, co2, tax } = computeEsg(valid ? qty : 0);
      dom.esgMeals.textContent = valid ? inr.format(meals) : "0";
      dom.esgCo2.textContent = valid ? `${co2} kg` : "0.0 kg";
      dom.esgTax.textContent = valid ? `₹${inr.format(tax)}` : "₹0";
    }

    /* ------------------------------------------------------------
       6. RENDERING
       ------------------------------------------------------------ */
    const isDispatched = (rec) => rec.status === "DISPATCHED";
    const isUrgent = (rec) => toNum(rec.expiryHours) <= URGENT_MAX_HOURS;

    function sortedDonations() {
      return [...state.donations].sort((a, b) => createdMs(b) - createdMs(a));
    }

    function cardHTML(rec) {
      const qty = toNum(rec.qty);
      const hours = toNum(rec.expiryHours);
      const urgent = isUrgent(rec);
      const dispatched = isDispatched(rec);
      const { meals, tax } = computeEsg(qty);
      const code = batchCode(rec);
      const fresh = !state.seenIds.has(rec.id);

      const shell = [
        "rescue-card relative rounded-xl p-4 transition-shadow duration-200",
        fresh ? "card-enter" : "",
        urgent
          ? "border-2 border-red-500 bg-red-100 is-urgent"
          : "border border-forest/15 bg-paper hover:shadow-card"
      ].join(" ");

      const statusPill = dispatched
        ? `<span class="inline-flex items-center rounded-full border border-emerald-300 bg-emerald-100 px-2.5 py-1 font-mono text-[10px] font-bold tracking-[0.12em] text-emerald-800">DISPATCHED</span>`
        : `<span class="inline-flex items-center rounded-full border border-amber-300 bg-amber-100 px-2.5 py-1 font-mono text-[10px] font-bold tracking-[0.12em] text-amber-800">PENDING</span>`;

      const urgentPill = urgent
        ? `<div class="mt-2.5">
             <span class="inline-flex items-center gap-1.5 rounded-md bg-rust px-2.5 py-1.5 font-mono text-[10px] font-bold tracking-[0.1em] text-white">
               ⚠️ URGENT · CRITICAL SPOILAGE RISK
             </span>
           </div>`
        : "";

      const action = dispatched
        ? `<button type="button" disabled aria-disabled="true"
                   class="mt-3.5 w-full cursor-not-allowed rounded-lg bg-emerald-600 px-4 py-2.5 text-[13px] font-semibold text-white">
             ✓ Driver En-Route
           </button>`
        : `<button type="button" data-dispatch="${escapeHTML(rec.id)}"
                   class="mt-3.5 w-full rounded-lg bg-forest px-4 py-2.5 text-[13px] font-semibold text-cream transition hover:bg-rust focus:outline-none focus-visible:ring-2 focus-visible:ring-rust focus-visible:ring-offset-2 focus-visible:ring-offset-paper">
             Assign Volunteer Driver <span aria-hidden="true">→</span>
           </button>`;

      return `
        <article class="${shell}" aria-label="Rescue batch ${escapeHTML(code)}">
          <div class="flex items-start justify-between gap-3">
            <div class="min-w-0">
              <p class="font-mono text-[9.5px] uppercase tracking-[0.16em] ${urgent ? "text-red-700" : "text-forest/45"}">
                ${escapeHTML(code)} · logged ${relTime(createdMs(rec))}
              </p>
              <h3 class="mt-1 break-words font-serif text-[19px] font-semibold leading-tight text-forest">
                ${escapeHTML(rec.item || "Untitled batch")}
              </h3>
            </div>
            ${statusPill}
          </div>

          ${urgentPill}

          <div class="mt-3 grid grid-cols-3 border-y border-sand py-2.5 text-center">
            <div class="border-r border-sand pr-2">
              <p class="font-mono text-[8.5px] uppercase tracking-[0.14em] text-forest/50">Quantity</p>
              <p class="mt-0.5 font-mono text-[15px] font-medium text-forest">${fmtKg(qty)}<span class="text-[10px] text-forest/60"> kg</span></p>
            </div>
            <div class="border-r border-sand px-2">
              <p class="font-mono text-[8.5px] uppercase tracking-[0.14em] text-forest/50">Shelf-life</p>
              <p class="mt-0.5 font-mono text-[15px] font-medium ${urgent ? "text-rust" : "text-forest"}">${fmtKg(hours)}<span class="text-[10px] text-forest/60"> h</span></p>
            </div>
            <div class="pl-2">
              <p class="font-mono text-[8.5px] uppercase tracking-[0.14em] text-forest/50">Meals</p>
              <p class="mt-0.5 font-mono text-[15px] font-medium text-forest">${inr.format(meals)}</p>
            </div>
          </div>

          <div class="mt-2.5 flex items-center justify-between gap-2 font-mono text-[10.5px] text-forest/50">
            <span class="truncate">${escapeHTML(rec.status === "DISPATCHED" ? "custody chain · driver assigned" : "awaiting volunteer driver")}</span>
            <span class="shrink-0 font-medium text-rust">80G ₹${inr.format(tax)}</span>
          </div>

          ${action}
        </article>`;
    }

    function renderCards() {
      const list = sortedDonations();
      dom.empty.classList.toggle("hidden", list.length !== 0);
      dom.grid.innerHTML = list.map(cardHTML).join("");
      list.forEach((rec) => state.seenIds.add(rec.id));
    }

    function renderStats() {
      const list = state.donations;
      const totalKg = list.reduce((sum, r) => sum + toNum(r.qty), 0);
      const meals = Math.round(totalKg * 3);
      const dispatched = list.filter(isDispatched).length;
      const active = list.length - dispatched;
      const urgent = list.filter((r) => !isDispatched(r) && isUrgent(r)).length;

      dom.statBatches.textContent = inr.format(list.length);
      dom.statKg.innerHTML = `${fmtKg(totalKg)}<span class="ml-1 font-mono text-[11px] font-medium text-forest/50">kg</span>`;
      dom.statMeals.textContent = inr.format(meals);
      dom.statDispatched.textContent = inr.format(dispatched);
      dom.statUrgent.textContent = inr.format(urgent);
      dom.statUrgent.className = urgent > 0
        ? "mt-1.5 font-serif text-[26px] font-semibold leading-none text-rust"
        : "mt-1.5 font-serif text-[26px] font-semibold leading-none text-forest";

      dom.activeCounter.textContent = `${active} ACTIVE`;
      dom.activeCounter.className = urgent > 0
        ? "rounded-full bg-rust px-3.5 py-1.5 font-mono text-[11px] font-bold tracking-[0.1em] text-white"
        : "rounded-full bg-forest px-3.5 py-1.5 font-mono text-[11px] font-bold tracking-[0.1em] text-cream";
      dom.dispatchedCounter.textContent = `${dispatched} DISPATCHED`;
    }

    const renderAll = () => { renderCards(); renderStats(); };

    /* ------------------------------------------------------------
       7. INTAKE (submit → Firestore addDoc | local push, no reload)
       ------------------------------------------------------------ */
    function showError(message) {
      dom.error.textContent = `⚠ ${message}`;
      dom.error.classList.remove("hidden");
      [dom.item, dom.qty, dom.expiry].forEach((el) => el.classList.add("is-invalid"));
    }

    function clearError() {
      dom.error.classList.add("hidden");
      [dom.item, dom.qty, dom.expiry].forEach((el) => el.classList.remove("is-invalid"));
    }

    function resetForm() {
      dom.form.reset();
      clearError();
      syncEsg();
    }

    dom.qty.addEventListener("input", syncEsg);
    [dom.item, dom.expiry].forEach((el) => el.addEventListener("input", clearError));

    dom.form.addEventListener("submit", async (event) => {
      event.preventDefault();                       // ← never reloads the page

      const item = dom.item.value.trim();
      const qty = parseFloat(dom.qty.value);
      const expiry = parseFloat(dom.expiry.value);

      if (!item) return showError('Enter the food item name — e.g. "40kg Paneer & Dal".');
      if (!Number.isFinite(qty) || qty <= 0) return showError("Quantity must be greater than 0 kg.");
      if (!Number.isFinite(expiry)) return showError("Shelf-life must be a number of hours.");
      if (expiry <= 0) return showError("This batch has already expired — it cannot be donated.");
      clearError();

      const { meals, co2, tax } = computeEsg(qty);
      const base = { item, qty, expiryHours: expiry, status: "PENDING", meals, co2e: Number(co2), tax };

      dom.submit.disabled = true;
      dom.submit.innerHTML = `Logging rescue… <span aria-hidden="true">◐</span>`;

      try {
        if (state.mode === "firestore") {
          /* ---- LIVE: write to Firestore `donations` ---- */
          const { serverTimestamp, collection, addDoc } = state.F;
          await addDoc(collection(state.db, COLLECTION), { ...base, createdAt: serverTimestamp() });
          toast("Rescue logged", `${escapeHTML(item)} is <b>PENDING</b> dispatch · ${fmtKg(qty)} kg.`, "success");
        } else {
          /* ---- LOCAL FALLBACK: in-memory demo array ---- */
          state.donations.unshift({
            id: `local-${Date.now()}`,
            ...base,
            createdAtMs: Date.now()
          });
          renderAll();
          toast("Rescue logged (local)", `${escapeHTML(item)} is <b>PENDING</b> dispatch · demo mode.`, "info");
        }
        resetForm();
        dom.item.focus();
      } catch (err) {
        console.error("[S2S] addDoc failed:", err);
        if (err && (err.code === "permission-denied" || err.code === "unavailable")) {
          enterDemoMode(`Firestore ${err.code === "permission-denied" ? "denied the write (check security rules)" : "is unavailable"} — local demo mode engaged.`);
          toast("Switched to demo mode", "Firestore write failed, so records stay in this browser tab.", "error");
        } else {
          toast("Could not log rescue", escapeHTML(err?.message || "Unexpected Firestore error."), "error");
        }
      } finally {
        dom.submit.disabled = false;
        dom.submit.innerHTML = `Log Rescue &amp; Dispatch <span aria-hidden="true">→</span>`;
      }
    });

    dom.demoFill.addEventListener("click", () => {
      dom.item.value = "Paneer Tikka Masala & Parathas";
      dom.qty.value = "30";
      dom.expiry.value = "1.5";
      clearError();
      syncEsg();
      toast("Demo batch loaded", "30 kg banquet surplus · 1.5 h shelf-life → urgent triage lane.", "info");
      dom.qty.focus();
    });

    /* ------------------------------------------------------------
       8. DISPATCH (PENDING → DISPATCHED, button locks to en-route)
       ------------------------------------------------------------ */
    dom.grid.addEventListener("click", async (event) => {
      const btn = event.target.closest("[data-dispatch]");
      if (!btn) return;

      const id = btn.getAttribute("data-dispatch");
      const rec = state.donations.find((r) => r.id === id);
      if (!rec || isDispatched(rec)) return;

      const previousStatus = rec.status;
      rec.status = "DISPATCHED";
      rec.dispatchedAtMs = Date.now();
      renderAll();
      toast("Volunteer driver assigned", `${escapeHTML(rec.item || "Batch")} is <b>en-route</b> to the shelter.`, "success");

      if (state.mode === "firestore") {
        try {
          const { doc, updateDoc, serverTimestamp } = state.F;
          await updateDoc(doc(state.db, COLLECTION, id), {
            status: "DISPATCHED",
            dispatchedAt: serverTimestamp()
          });
        } catch (err) {
          console.error("[S2S] updateDoc failed:", err);
          rec.status = previousStatus;
          delete rec.dispatchedAtMs;
          renderAll();
          toast("Dispatch update failed", escapeHTML(err?.message || "Could not persist the status change."), "error");
        }
      }
    });

    /* ------------------------------------------------------------
       9. REALTIME (onSnapshot) + LOCAL FALLBACK
       ------------------------------------------------------------ */
    function seedDemo() {
      const now = Date.now();
      state.donations = [
        {
          id: "demo-batch-1", code: "#RG27",
          item: "Banquet Paneer Tikka & Dal", qty: 40, expiryHours: 1.5,
          status: "PENDING", createdAtMs: now - 7 * 60_000
        },
        {
          id: "demo-batch-2", code: "#RC51",
          item: "Fresh Roti, Chole & Rice", qty: 18, expiryHours: 5,
          status: "PENDING", createdAtMs: now - 26 * 60_000
        },
        {
          id: "demo-batch-3", code: "#RB08",
          item: "Surplus Bakery Breads & Buns", qty: 12, expiryHours: 8,
          status: "DISPATCHED", createdAtMs: now - 52 * 60_000,
          dispatchedAtMs: now - 44 * 60_000
        }
      ];
      state.seenIds.clear();
    }

    function setModeUI(mode, reason) {
      if (mode === "firestore") {
        dom.modeChip.className = "inline-flex items-center gap-2 rounded-full border border-emerald-300 bg-emerald-100 px-3.5 py-1.5 font-mono text-[10px] uppercase tracking-[0.16em] text-emerald-800";
        dom.modeDot.className = "h-1.5 w-1.5 animate-pulse rounded-full bg-emerald-500";
        dom.modeLabel.textContent = "Firestore live";
        dom.banner.classList.add("hidden");
        dom.footerMode.textContent = "Firestore live · onSnapshot streaming";
      } else {
        dom.modeChip.className = "inline-flex items-center gap-2 rounded-full border border-amber-300 bg-amber-100 px-3.5 py-1.5 font-mono text-[10px] uppercase tracking-[0.16em] text-amber-900";
        dom.modeDot.className = "h-1.5 w-1.5 animate-pulse rounded-full bg-amber-500";
        dom.modeLabel.textContent = "Local demo mode";
        dom.bannerText.textContent = `⚠ ${reason}`;
        dom.banner.classList.remove("hidden");
        dom.footerMode.textContent = "Local demo mode · in-memory array";
      }
    }

    function enterDemoMode(reason) {
      if (state.unsub) {
        try { state.unsub(); } catch (_) { /* already detached */ }
        state.unsub = null;
      }
      state.mode = "demo";
      state.reason = reason;

      const hasLiveRecords = state.donations.some((r) => !String(r.id).startsWith("demo-") && !String(r.id).startsWith("local-"));
      if (!hasLiveRecords && state.donations.length === 0) seedDemo();

      setModeUI("demo", reason);
      renderAll();
    }

    async function startRealtime() {
      try {
        const [appModule, firestoreModule] = await Promise.all([
          import(`${FIREBASE_CDN}/firebase-app.js`),
          import(`${FIREBASE_CDN}/firebase-firestore.js`)
        ]);

        const {
          initializeApp
        } = appModule;
        const {
          getFirestore, collection, addDoc, onSnapshot, doc, updateDoc, serverTimestamp
        } = firestoreModule;

        state.F = { addDoc, doc, updateDoc, serverTimestamp, collection };
        const app = initializeApp(firebaseConfig);
        state.db = getFirestore(app);

        state.unsub = onSnapshot(
          collection(state.db, COLLECTION),
          (snapshot) => {
            state.mode = "firestore";
            state.donations = snapshot.docs.map((d) => ({ id: d.id, ...d.data() }));
            setModeUI("firestore");
            renderAll();
            if (snapshot.empty && state.donations.length === 0) {
              console.info("[S2S] Firestore connected — collection is empty.");
            }
          },
          (err) => {
            console.error("[S2S] onSnapshot error:", err);
            enterDemoMode(`Firestore listener error (${err?.code || "unknown"}) — local demo mode engaged.`);
            toast("Live sync unavailable", "Falling back to seeded local records.", "error");
          }
        );
        console.info("[S2S] Firestore v10 initialised ·", firebaseConfig.projectId);
      } catch (err) {
        console.error("[S2S] Firebase SDK failed to load:", err);
        enterDemoMode("Firebase SDK could not load (offline?) — local demo mode engaged.");
        toast("Offline fallback active", "Running with seeded demo records until the CDN is reachable.", "error");
      }
    }

    /* ------------------------------------------------------------
       10. BOOT
       ------------------------------------------------------------ */
    dom.reconnect.addEventListener("click", () => window.location.reload());

    syncEsg();

    if (hasRealConfig(firebaseConfig)) {
      startRealtime();
    } else {
      enterDemoMode("firebaseConfig is empty / still has placeholders — records live in this browser tab only.");
    }

    /* Keep “logged Xm ago” labels honest */
    setInterval(() => { if (state.donations.length) renderCards(); }, 60_000);
  </script>
</body>
</html>

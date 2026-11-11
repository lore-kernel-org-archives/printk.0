Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412264;
	b=OsdikYCzy4U/032sTBpfq5joELbvq/hYTe0qEjqyAEFYqFfPOrAOurjO8avoxJpYkGyU
	 NxAysUGQfBNWls1VIyXl0ZAen1zhd8ZbVqxxRElYfQNP+XMF57DtjKdAFTrBwj3DzT0Mv
	 AdYvlbiltbZMkQSh4oD3vM80VUC3jmbotABcHjfq336VmIPm9+MYY7xCymr4o0yDS6XMR
	 jNT91Ppw+bln8aVo/Hgtih0JKBgk08hr8unlJzrxfAyK2e43oWuRfciSP8w/T6yguq4n1
	 LJcfcmJM+V/AqrygbwUCxlH3sqp0WWQQayV0TM8Ji6dXVS8xZ1YDRquOHp7bfs0w31g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9Bfjjj9irve64tipxghBwxDJReF7LUZfPFLzgqMHWwA=;
	b=Vfu4t4zbE/LJdqwwC5dvn2oTQEBVQeRQbEECiu2EmdaVd8cBDY/497DfEWAhe7+P/Ccb
	 w77xUYx+y/Fc69a2eiBFD0Ol+b4KxdFWonS7igYBmPM9mirZP82jefq2PMloZ9d/Bb9Aq
	 3r4vjdYkviakmS6Ws4kaxEipWEckQ5OhbxITyfvsu9Tu0FGU8/0vK3H79qRHRBozy+mJA
	 BWCdAgKgmm3+122f7zNuKNw+KOA9G2Kj4ojgV8HSiWp6u0XUR1V8Cd+tJuBR3pDySDRQL
	 9p0IVJlYFoN3W2n/xSqg4esymShaKka5iFRZAUvx6XEpJUmV/1m7ZTuumWpvHhVnQ/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=QVkln6TT;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28440606A32D
	for <printk@lists.linux.dev>; Wed, 11 Nov 2026 15:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28440606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=QVkln6TT
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b467581b98so30559975e9.0
        for <printk@lists.linux.dev>; Wed, 11 Nov 2026 07:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412262; x=1795017062; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Bfjjj9irve64tipxghBwxDJReF7LUZfPFLzgqMHWwA=;
        b=QVkln6TT9lXt/ylxgbl1PZppw/QXroB1/K6p2tGnyl4UblHJcOwvqk71VbPLfzuIgd
         ERRaWFn9+Ir4l600V9P537mtgDjbtyT/YcfJjRmo98UsSAcbCPv4JsTcl3XLoF1t3dYB
         1Xsb8FSUwPOpNvjEHUh/5UzWe9TvLtUiZJdh+CN5Abr+MbPYSorO3b5xM12NJKSh3TLL
         C3nv6S9kVmc1c6Qf3tsnwGiJDCKRvq+3asA0OwPu/z/0XvfW3bFF3ZmyaTVxZ8CCfiHy
         vHT1ttDbQjG/LM1gSV2YgihozHhvTWm531sTjDdPi2BmO4CJon2j5rNBihMHzoMwU0R8
         QsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412262; x=1795017062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Bfjjj9irve64tipxghBwxDJReF7LUZfPFLzgqMHWwA=;
        b=sYBxf60ElWb9pvu2ctGB9gPCW7OXQeC5F0RknOFkO6/lWkWjgy8NRvyZfD0s+Yvjs6
         L08016bnCO39fT/hDipxm7AXq+ROm4lalLWyiVyRUWzytcv9PJAJKhN9DorJgNdhJtVT
         4NZx4J0MANLQmc4zMkFYDgPSE7n1+LcIB04wnAXAyIAwzBAHtCsMn9A6fnY3Pv2vLzyJ
         F+EZufd2yqrzexlEa/bk7Tv3a2qeZR/YAl+6iW4CPwaqaB8pPcX0XANlQXbcMG6/Z8Z/
         p/K2JL9m+nqgHdXcCAtwhNkOuIEtPD8mGYNNh0msGDp7nJti/sPa2T9Au/1b0bhBFd8l
         trHw==
X-Forwarded-Encrypted: i=1; AL+hErGD5BS2johz9casY5hespSydrq9XBn4IYsomXMVYLpd33l2w7uNZhciGnRgTRGrjNhDUhVJXnM=@lists.linux.dev
X-Gm-Message-State: APuU4Z+7yI0+zrWwG1DfVA4Fj6aE5E/dK5iL1hM6N1/V4AL5Ek/xKppK
	lkFRF7ZkEp7DHlbXK//gWmZZpOZn6IYcOJRIdeWNeIvnfxKWQzgnim1EJCLWiYjFZzk54+QCwxx
	/2kjdC9I=
X-Gm-Gg: AYBFou3Fe72a9cKzLYtiv1cIPIDg0l1ZNCNV04MX378GMlvd7gpndlxqCcxu+1rOL9i
	5R3Dld78uAw0/Tkj/6Rao4K/mu0raquaBhaoohrdGlDLxq0ShRM1Yp39fTpoEXXDDLbBPLtiOPi
	0P0OZN837lLUkXUMnwBF4Icnp8I7QC9+pUUDmWtZJ2/okMSZ4YekH4W08Ze0MDljvtggjEbYGEL
	GkaOurmgL73GpJNp+/KZQWXzdvLqNusBpLFezGq3G1Sf+H010wfl2tHFAWXXpEmJnaH8d1NnOk0
	tl6Ga5k7F7aCFHf6TsasK4hbExZ1pzswVPJ/UwYx45ppfNRIhQ9f2o41qLY6DOfli1jdGJSgRcx
	W+7zAvvNZRgUw3QbHkc+wMhqNEEbKYKtCK4VV+AzasId7v1C9PWFYgykEW6arVwxsp351kmwrQi
	Zji3VmNuz95rb/2tOeOC2w0jw16jGyxE71Mp4G8XdJ6xDQg3qtnIegdZDHcEvM5kx+TnwcksslA
	awA/ukomE2Qb04kHVuuZ8AMMSTT7asF/5C1oN/McerCpGnWbgxi88sJDeeDXRYYvpPPJ6wrVQOB
	zv+oHudYf/NnEc/1fnxrq2DFZb9IPe4=
X-Received: by 2002:a05:600c:8b31:b0:4ba:7e6:53d6 with SMTP id 5b1f17b1804b1-4ba093c1843mr39316645e9.33.1794412262410;
        Wed, 11 Nov 2026 07:51:02 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c5f53efsm4423105e9.13.2026.11.11.07.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:51:02 -0800 (PST)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v7 13/17] printk: Try to register each console as Braille first
Date: Wed, 11 Nov 2026 16:48:12 +0100
Message-ID: <20261111154816.71103-14-pmladek@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111154816.71103-1-pmladek@suse.com>
References: <20261111154816.71103-1-pmladek@suse.com>
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Braille consoles are unique: they can only be enabled via the command
line and use the preferred console framework for initialization, yet
they are never added to the console_list or associated with
/dev/console. Because of this, the preferred_console variable remains
unset when only a Braille console is requested.

Currently, try_enable_preferred_console() must be called even when
"preferred_dev_console" variable is not set, just to catch these "hidden"
Braille requests.

Refactor the logic by adding a parameter to try_enable_preferred_console()
to explicitly handle Braille vs. non-Braille cases. It will eventually
allow to skip try_enable_preferred_console() when there are no preferred
consoles. This improves code robustness by ensuring the console
setup is explicit and only performed once.

Note that _braille_register_console() is skipped when the given console
driver has a match() callback and it succeeded. It means that it took
over an early console and can't be used as a Braille console.

As a result try_enable_braille_console() might return success even
when it did not enabled the console in the Braille mode. It is
the reason why register_console() has to explicitly check whether
CON_BRL flag was really set and could skip the further steps.

Behavior change:

1. The Braille console driver is newly always preferred even when different
   serial ports are preferred. For example, let's have the following
   command lines:

     a) console=ttyS1,115200     console=brl,ttyS0,115200
     b) console=00:00:0.0,115200 console=brl,ttyS0,115200
     c) console=brl,ttyS0,115200 console=ttyS1,115200

   They all create two entries in preferred_consoles[] because:

     a) and c) differ in @index (0 vs. 1).
     b) defines either @name or @devname.

   But the original code registers:

     a) ttyS1 as normal console because it is the 1st entry in
	preferred_consoles[].

     b) ttyS0 are Braille console because the generic "ttyS" driver
	is registered early in univ8250_console_init(). The @devname
	entry is resolved too late when serial8250_init()
	registers all found devices, it assigns "tty0" for
	the given "00:00:0.0" but it is already in use.

      c) ttyS0 as Braille console because it is the 1st entry in
	 preferred_consoles[].

    The new code would register ttyS0 as the Braille console in
    all three variants because try_enable_braille_console() is
    called 1st.

2. When only the Braille console is defined on the command line,
   the original code might attempt to enable the same console twice.
   One as a default and once as a Braille console. This results in calling
   the setup() callback twice and incorrectly setting the CON_CONSDEV flag.

The 1st change makes the behavior more consistent and understandable.
The 2nd change is an obvious bug fix.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
---
 kernel/printk/printk.c | 58 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 52 insertions(+), 6 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 5a2e6f1b9907..617414d419b1 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -366,6 +366,7 @@ static int console_locked;
 static struct preferred_console preferred_consoles[MAX_PREFERRED_CONSOLES];
 
 static int preferred_dev_console = -1;
+static bool want_braille_console;
 /* Set when there is at least one console preferred via the command line. */
 int console_set_on_cmdline;
 EXPORT_SYMBOL(console_set_on_cmdline);
@@ -2651,7 +2652,9 @@ static int add_or_update_preferred_console(unsigned int i,
 		braille_set_options(pc, brl_options);
 	}
 
-	if (!brl_options)
+	if (brl_options)
+		want_braille_console = true;
+	else
 		preferred_dev_console = i;
 
 	if (user_specified) {
@@ -3987,8 +3990,9 @@ int console_call_setup(struct console *newcon, char *options)
  * by either the command line or add_preferred_console() and
  * setup/enable it.
  */
-static int try_enable_preferred_console(struct console *newcon,
-					bool user_specified)
+static int __try_enable_preferred_console(struct console *newcon,
+					  bool user_specified,
+					  bool try_only_braille)
 {
 	struct preferred_console *pc;
 	int i, err;
@@ -3999,8 +4003,21 @@ static int try_enable_preferred_console(struct console *newcon,
 		/* Console not yet initialized? */
 		if (!pc->name[0])
 			continue;
-		if (pc->user_specified != user_specified)
-			continue;
+
+		/*
+		 * @try_only_braille and @user_specified define which
+		 * preferred console entries are handled in this round.
+		 */
+		if (try_only_braille) {
+			if (!is_braille_console_preferred(pc))
+				continue;
+		} else {
+			if (is_braille_console_preferred(pc))
+				continue;
+			if (pc->user_specified != user_specified)
+				continue;
+		}
+
 		if (!newcon->match ||
 		    newcon->match(newcon, pc->name, pc->index, pc->options) != 0) {
 			/* default matching */
@@ -4013,7 +4030,7 @@ static int try_enable_preferred_console(struct console *newcon,
 			if (newcon->index < 0)
 				newcon->index = pc->index;
 
-			if (is_braille_console_preferred(pc))
+			if (try_only_braille)
 				return _braille_register_console(newcon, pc);
 
 			err = console_call_setup(newcon, pc->options);
@@ -4029,6 +4046,17 @@ static int try_enable_preferred_console(struct console *newcon,
 	return -ENOENT;
 }
 
+static int try_enable_preferred_console(struct console *newcon,
+					bool user_specified)
+{
+	return __try_enable_preferred_console(newcon, user_specified, false);
+}
+
+static int try_enable_braille_console(struct console *newcon)
+{
+	return __try_enable_preferred_console(newcon, true, true);
+}
+
 /* Try to enable the console unconditionally */
 static void try_enable_default_console(struct console *newcon)
 {
@@ -4051,6 +4079,24 @@ static int try_enable_console(struct console *newcon)
 {
 	int err;
 
+	/*
+	 * First, try to enable the console driver as a Braille console.
+	 * It would have metadata in the preferred_consoles[] array.
+	 * But it won't be counted as preferred_dev_console because
+	 * it does not get printk() messages and is not associated
+	 * with /dev/console.
+	 *
+	 * Note that it might succeed also when the driver has a match()
+	 * callback and it took over a boot console. In this case,
+	 * the driver will continue working as a classic non-Braille
+	 * console.
+	 */
+	if (want_braille_console) {
+		err = try_enable_braille_console(newcon);
+		if (err != -ENOENT)
+			return err;
+	}
+
 	/*
 	 * See if we want to enable this console driver by default.
 	 *
-- 
2.56.0


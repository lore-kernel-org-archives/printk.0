Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985751;
	b=KQ2FqLnASk4A19DdgqV7g0y4TS9inpxOCeUo421Ecl9cHl7iA1cs450aBGT9ju35s9tK
	 NSiVLH+unVWmQVhH51KVWbjfY9evhQTugemvt+15o/jhqYL807JEU0FiubhsIcCiEH0LH
	 28nw2hE8NCe0IL1h+5PnE/LrqzQ3NFcwi6UE3onAvAd1+J7EqH2MuNC4prT3qSP/PEHS+
	 UeVVrgEEeNko+iPDBnfNdQJ1Hd/XDq2D4xUh0edsi0eJRIVRgvkPUkn6B2D8WHuaOUiTs
	 Cx4W5isU1EDq76DUejkUBDvNFWs4/oMhCooYNxzcVD6Zfq0gkIXxg0ZZPQRTF73QSPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1ZlRTZyG90aBhHc3pJWw9EK0xkQ7hrbVzYow7IEo9Co=;
	b=mjy7WUMTnDGuNF5c7j0ArzhMXtr+1yVsgmjjtaMa0/Z17G+A6RaZDxqG2br447oFA3oL
	 bVYT8QQpYLDXoddv+6XKnvlZefZoPO6A4KiaGdh/gfu7CJJamMrlwgRVH8kf/KQnjjj6e
	 8FweTI+nNkZ2EBmtHXCTkUKKdRmBnpTzTFUBnMlLjgieXxMhhoEF0NXNChPAyo6magzHw
	 Ft2DfKuvYNNJ4+2MyPr4m/v3BKZq6+HYszFwHNkCyzf2VW682B3yJ2mCWgY7duaWPN41s
	 yLAHHP/ibGoBQrQ7b4Z4F3QSrJLSBIc6Q3adLNn4lObQrlG+s20hQlfuoUhPUcUyD+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GxxOstF9;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C9C606A326
	for <printk@lists.linux.dev>; Fri,  6 Nov 2026 17:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37C9C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GxxOstF9
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so7979535e9.3
        for <printk@lists.linux.dev>; Fri, 06 Nov 2026 09:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985750; x=1794590550; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ZlRTZyG90aBhHc3pJWw9EK0xkQ7hrbVzYow7IEo9Co=;
        b=GxxOstF9YfUjboGh15ENgjgoUnr231o8RRNSj8uJNghkASaw9ru6aY0V8hRPXbzRJL
         JFe2SZMxzMEilCi2tVrczRfxs2/+OU3+UUpI9iBxpq3ijt2teFBGxK2bIGjZlR1fKuUw
         2P6U/e/dYgPyTeMZ4FHRHFR1w2ooFUJULC5qXB3XA3WzY5vcdcQrIOCRn3jZ++7qYj/s
         WrMGl0xrS7womeAdX945sH098+PUl75UC4tezuAz9qMJouQuRx/ALyTajtvlvSja9npC
         3qA1pNojyt1NEr6Dpz5mLrrVSnhepP5cRE+dPxWnbOOYmLmNxXxAVndRoVArM9WHc1Gw
         TGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985750; x=1794590550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ZlRTZyG90aBhHc3pJWw9EK0xkQ7hrbVzYow7IEo9Co=;
        b=qTtpRg/IdjtHZ7HPrjsRVpC/kgSMyEj6kbrhZXi5nWshL5rM2F7YJUIka3Osabnylo
         +/IQBQZPeAP309Xq0pfGXNWVqCUtgTlYgYt+hM9b9wEBZkO+Sgq+lkQY42Sf6JpUi/dr
         HWsc6csOlFq6yp3sdMQJDt92YeZONACOBSyx8xF3WYPn7q99QUBuW/9D9ADnkGjtBcV3
         AnuYPM0+oM9e0kErv8UYx5TnYaEFFgri0L5tct8QSTQebPdXMm6k0ZPcmVX0ln12+H+0
         SqhrlUNWaTp/VuaKUfaxjFtObAE3D+/HQQoxX/FXnoT+dJ/toInTkme7H+uK3OhwapJm
         D/ig==
X-Forwarded-Encrypted: i=1; AKwUvBxfRAyRejIyiLEOgf10Qxf4IwpCb3g+GhTbtgKmmROxicNSkcBrci8fMncTFu95QJDQO+H4DRo=@lists.linux.dev
X-Gm-Message-State: APuU4Z8Q5TCaFkkgMarK2TpeZz5O5h4G8d0FJsWU8k4OHB7h9hWnSZRk
	NU+JT5Vb9bVXx3DF/CObJmdh/2z/DUaXaQ17blfXXzZAvStjoGBxa7+gsFg59AbmyGAz2Hlw/BT
	Mq9kFhPM=
X-Gm-Gg: AYBFou1q/SE7nO5wCyMLZfYXFIc1jAyiWMaEm9bcx4zRyor/YRkAQJNENa8W6od4WEb
	ZS8+PY7B0yaXTTLrBhJo6bVIDmKrKYJz24M1xx3ACjkwF7/hgygLgkejj7KOCJGTt1f1sMfC8xl
	ZnMt4RzSR2SS0K4Ja9Jf9fnLx1OljhrTjRHOwV6YUhCosODsq5CB1YX5dY/Wqrxpet1ZZJdmjRn
	GlH/kN6jlqr5lL55A+c4dVS1f2KKrwiAgHiOvuXz/E6dR6Nq85bEo8ccXCINJBS55Z0NFu5WOuT
	/+oUvVVF60AxI0om5NbvVk9skYme+5ZB2IXLq5Djnf+kmVJZbdI9zyYl57Ar9tWXhka3zZDx7+o
	aitPdbiFAzVuk8A8/TYJWzayEWRx2AhHM/UaEYODkhjASD7cwKb1cGPjHEYb0O5qquJQ9IpKHHD
	sPm5fXerYDaRjs//7ACy4gZScZYTxQWkrURYJRd0UDCFtacy3kbcLX35zueNInSQQtWMYv+xMuD
	2uNa76U0lFIBscnqTH5ALp2teQxlgbJlmCjlIC30DHnzDK7X5rlCIVt2+E34Ky2z460mewHlQK1
	YFcCDYgaFVxv965CzFSoi+d/dCAjYl4=
X-Received: by 2002:a05:600c:4e11:b0:4a2:59:f568 with SMTP id 5b1f17b1804b1-4b6ddee38a5mr53567455e9.14.1793985749669;
        Fri, 06 Nov 2026 09:22:29 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbe9e31sm10185655e9.2.2026.11.06.09.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:22:29 -0800 (PST)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v6 11/16] console/braille: Lock console->setup() call during the registration
Date: Fri,  6 Nov 2026 18:19:47 +0100
Message-ID: <20261106171952.207909-12-pmladek@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106171952.207909-1-pmladek@suse.com>
References: <20261106171952.207909-1-pmladek@suse.com>
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

In braille_register_console(), the console->setup() callback must be
called while holding the console_lock. This prevents a race condition
with a possible active boot console that might be using the same hardware
registers.

See also the commit 801410b26a0e ("serial: Lock console when calling into
driver before registration").

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260423130015.85175-1-pmladek%40suse.com
Suggested-by: John Ogness <john.ogness@linutronix.de>
Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
---
 drivers/accessibility/braille/braille_console.c | 10 +++++-----
 include/linux/console.h                         |  1 +
 kernel/printk/printk.c                          |  8 +++++++-
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/accessibility/braille/braille_console.c b/drivers/accessibility/braille/braille_console.c
index 1b79b4d88bac..bc338e57d8ef 100644
--- a/drivers/accessibility/braille/braille_console.c
+++ b/drivers/accessibility/braille/braille_console.c
@@ -408,11 +408,11 @@ int braille_register_console(struct console *console, int index,
 		console_options = "57600o8";
 	if (braille_co)
 		return -ENODEV;
-	if (console->setup) {
-		ret = console->setup(console, console_options);
-		if (ret != 0)
-			return ret;
-	}
+
+	ret = console_call_setup(console, console_options);
+	if (ret != 0)
+		return ret;
+
 	console->flags |= CON_ENABLED | CON_BRL;
 	console->index = index;
 	braille_co = console;
diff --git a/include/linux/console.h b/include/linux/console.h
index cb8be9ea4a76..b68279a22514 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -710,6 +710,7 @@ enum con_flush_mode {
 };
 
 extern int add_preferred_console(const char *name, const short idx, char *options);
+extern int console_call_setup(struct console *newcon, char *options);
 extern void console_force_preferred_locked(struct console *con);
 extern void register_console(struct console *);
 extern int unregister_console(struct console *);
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 49c5624eede0..0e68af9a3490 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3957,7 +3957,13 @@ static int __init keep_bootcon_setup(char *str)
 
 early_param("keep_bootcon", keep_bootcon_setup);
 
-static int console_call_setup(struct console *newcon, char *options)
+/*
+ * The function is intended only for the generic console registration code.
+ * It has been made global only for the Braille console driver which
+ * is partly using the generic console registration code but it is
+ * integrated with VT code instead of printk().
+ */
+int console_call_setup(struct console *newcon, char *options)
 {
 	int err;
 
-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985620;
	b=TezXF3o0OjWW78M+zJOQDa0sWybkxiuwK15UAPifdrBfRd/q5OgjbNPOGoHn0Aaqibmj
	 itLxS54jIYV3tthP5TMMR1k6pe14B6pjybfICedzsYUVp0gyJ8gLUOZdw5KuxBl0qhNq9
	 hTfvJct+EJf/Ksp3Rsj3NYdGKKOdz97fog77jpLD5Qp1aN7K7ghVcS8WE1n/sQ0ZOK/wy
	 Fk8Xcf4wcDrW9DMpZBjH5DZkBFDFRiu70+IYsgYw+D41yTq++i6upULE92szi8JUYaBXm
	 C4rLKJO9Rw1VusUvYd7PCTrQ6j3oqQGu9h/5ttVfm/DcUrQKk/IzP51Rm09u5dcUVpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vDe53dt4rJuBDqVFYRKRy0bDGsLtr15VB9Eg8wIwBs0=;
	b=HkTXJiQCOQWC0HyEHsk5iYVwwkFM0A6fByBDGlr7NIW4uqGJ4TeyWGvTj1qK5lquUYNo
	 mFPbUon/TD6qqGtHPLmwQicwxFux6yrMfmAHfU1A97TxUuVEb/wdhR+ooMAe+0bilut2f
	 PADguoRJjVu0ES3pZzgjby1iVlJwaP/R/k7OdF80xsedtvGZ0rMuicedqqUgzqRobpHjL
	 YnXefSVObx9jqyAIz7lmvCYJxdVsiU8TKlvYDi2GX0DE1oGZCUgPj+wdbSUssB4Eo/Nmj
	 rhIs8nmaC70qsznjpFrsoe1RE2WTvZyEe8Bw5WfaO437yJJNrr+tdOhjtbEdDi9Mrpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AMF8UwtP;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2286606A329
	for <printk@lists.linux.dev>; Fri,  6 Nov 2026 17:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2286606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AMF8UwtP
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso225995e9.1
        for <printk@lists.linux.dev>; Fri, 06 Nov 2026 09:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985618; x=1794590418; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vDe53dt4rJuBDqVFYRKRy0bDGsLtr15VB9Eg8wIwBs0=;
        b=AMF8UwtP2s92CeJXPYxQoEh34/DcAoVP4up/gWKY6JOSWq3mDjXaK5lhKo9JAtM6zB
         8+V+iI61KBcwidfKoCbLHOSX9eHF6+fty7T2BE1FV2mJ0uf2+KaJAd2hEla1kkDeRXCw
         cmYHdN+eSZ43SWBbS8RvcmJkxfBrXcNjCgLbM/U6v0Fr7k6FQAvr7TtEy98Gdv9UtlP0
         47pRGKQt0HqtzRtfXZz6jbaofjc/aAroO7J6aCHCYEnf8Wjf7Tjr9KycmjfVaJzHOO65
         yeXjLKvpy5joVyUXT8lQtgvLeGUQ29+aRoKy0xYENISsQUQGiBEi2W5Bl8I0wSNjZM9F
         uqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985618; x=1794590418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vDe53dt4rJuBDqVFYRKRy0bDGsLtr15VB9Eg8wIwBs0=;
        b=yiS7uvtGb3ZRywEz7DnIQguEclBpRrqIpPdVeXPF+t+MEKj0f9D/OZOe3T8jFwb4Y3
         wMyfSS5HdSDkyWCOLukRpkrglzVLH6kRbytS93YbAI27J/dlJlPELbarNqphtMoYGioO
         XuT7MHkHCNzL7VC3GJ8x0G0Q0Wny38tJzUnBF/zsz6o6B28hdgb2UKIgz8WTGvyOyT6K
         ozfI1zdStVpx0soxnDJqEWNW+3gv4LKvpsX1VCMZ60zbFHQCOkaaVmDjy+d+BqAW5XaR
         8nnQ895bBz64poO7rg1v11k0CzNaN4LpE6RTwWf8Lau6gkJotD5Sg/FcGgOG9rAiddxp
         97FA==
X-Forwarded-Encrypted: i=1; AKwUvBxAeBHAWaUfHl4amrwBZPdFIXXpccjC6xE7QQOfS3mpQwcZ/uIF8GoltsgqN9hInUuwiNQrTXY=@lists.linux.dev
X-Gm-Message-State: APuU4Z+l4vDwZf8pfFVoJ8thAdvIgIySlwon+fbwQFqdeQ3AfaqjXU08
	KmNhe+k6sZw/ZBqFo82OWGjawsOjIe1YGzEjcyFGC4eb+PZuTEBXF3uOUocK55oBJNI=
X-Gm-Gg: AYBFou0CGrGAMXV5mqw1b+tsGeJJzVj8oVfD9LhBv1piguhbGqoqNbpHblcTJZCaDR7
	oo3H4b0IgIoqLKogrHB3KSH8XA+U37fMIPw6Yk3hp2pv9sG7K7Vn+MqXJfzi03np5cv5Z/vrPUC
	lcO6gJ+/06k4ECb5gqhes2mAmByW9TfPDT2WBeuKgFJu24UCcgsEljzAxT2K+AIZWdR8z7siqx2
	lxE5FgfVdREvj9Tza+r0AmqRGfIybv/JRKSm9lrp89hWDL4xYxv1WHCK69xKr6otyv4gdlw8wqJ
	uHUShYgrbSUm+24e9WosRIFM3eOlyVjbnw2Dorj+90CH22oKZZn84O5s3wWIdzt8oW3iqasykII
	2BEFxZhInheP9ra5Ba/7oKZDjAQZF8fJyhHuQNGt32gJqXJCsLcNHY32bxJO5H6jdfPuVHp/EEU
	Q1ctCvVnLh+0L9ri8uQthMTnpc7nYVVVCvqMuLRtMlWyYSMmNmKmjSJ9x32wd7BPcexS/upgdri
	Mp5f+ZAju7GjnDPgoJ4IyfjiizuzOFr+8VyvjmtrMfh2hdrACNHVzRqdfYS38OExF45K5HrV2aE
	leZiWIOlJjzqx4K5IzrYdFvFIFmik2g=
X-Received: by 2002:a05:600c:811b:b0:4a5:cfc:1e95 with SMTP id 5b1f17b1804b1-4b6e063f269mr51588105e9.33.1793985618030;
        Fri, 06 Nov 2026 09:20:18 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49354fc5ab4sm2701646f8f.30.2026.11.06.09.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:20:17 -0800 (PST)
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
Subject: [PATCH v6 00/16] printk: Clean up preferred console handling
Date: Fri,  6 Nov 2026 18:19:36 +0100
Message-ID: <20261106171952.207909-1-pmladek@suse.com>
X-Mailer: git-send-email 2.56.0
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

Hi,

this patchset does some clean up of the code for handling preferred
consoles in the console registration code.

It is a prerequisite some more patchsets, namely:

  + for Marcos' clean up of CON_ENABLE
    flag handling. It should prevent regressions caused by the
    hidden effects of try_enable_preferred_console(), for example,
    see https://lore.kernel.org/r/89409a0f48e6998ff6dd2245691b9954f0e1e435.camel@suse.com

  + for Chris' per-console log-level, see
    https://lore.kernel.org/r/cover.1764272407.git.chris@chrisdown.name

and maybe even some more.


Changes against [v5]:

  + Updated comment about preferred_consoles[] (1st patch) [Chris]
  + Removed extra newline (1st patch) [Chris]

  + Added back two comments (4th patch) [John]
  + Fixed kernel-doc formatting (4th patch) [Chris]

  + Added check for empty @name or @devname (5th patch (new)) [Chris]

  + Fixed typos (6th patch) [Chris]

  + Added back "[*]" (7th patch) [John]

  + Removed problematic patch which allowed to override
    console options via the command line (9th patch in v5)) [Chris]

  + Added comment about that console_call_setup() was made global
    only for Braille console driver. (11th patch) [Chris]

  + Reworked description of behavior changes when preferring
    Braille over non-Braille preferred console entries (13th patch) [Chris]
  + Fixed comment: s/preferred_console/preferred_dev_console/ (13th patch) [Chris]

  + Optimize handling of preferred_dev_console list (14th patch) [Chris]

  + Added Reviewed-by and Acked-by tags. 


Changes against [v4]:

  + Removed 1st patch from v4. Already in upstream.

  +  Cleanup _braille_(un)register_console() wrappers already in 3rd
     patch. is_braille_console_preferred() will be needed sooner.

  + Split 4th patch. Start with reshufling the add_preferred_console()
    code without any functional changes. Add the various checks
    and behavior changes one by one is a followup patches.

  + Rework the code to make it clear when it is a new entry or an update.

  + Put back braille_set_options() which just updates the optional
    entry. The logic when the value should get updated is the same
    as for pc->options.

  + Make sure that options can be overridden by the command line.

  + Add preferred_dev_node to remember the ordering of preferred consoles.
    Use it when the last one becomes Braille. The previous version tried to
    remembered just the last preferred console. But the logic because
    pretty complicated when I tried to make it error proof. AI was
    able to find many scenarios where it broke. The list is
    the ultimate solution and is easier in the end.

  + Use console_call_setup() in braille_register_console() instead
    of duplicating the code [John]


Changes against [v3]:

  + Move the handling of pre-enabled consoles into register_console()
    as 1st patch. It prevents a possible invalid access. [Petr]

  + Move the code for handling pre-enabled to console to
    try_enable_console() in 7th patch. The resulting code
    is the same as in v3.

    This 2nd move was not needed in v3 because the code
    was moved to this final location later. [Petr]

  + Switch order of the 10th and 11th patch. Aka make
    try_enable_default_console() return an err before
    refactoring try_enable_console() call
    try_enable_preferred_console() only when there is any.
    [Petr]

  + Initialize err value in try_enable_console() in 11th patch.
    It prevents using a non-initialized variable. [AI:gemini-3]

  + Make sure that pre-enabled consoles won't get registered
    when something went wrong in try_enable_console()
    in 11th patch [Petr]


Changes against [v2]:

  + Move static_assert() after declaration (1st patch) [Steven]

  + Rename update_preferred_console() to add_or_update_preferred_console() [John]
  + WARN_ON() when called without "name" and "devname" [John]
  + print error when reached MAX_PREFERRED_CONSOLES
  + Add comment above code adding new entries [John]
    (all in 4th patch)

  + Call console->setup() under console_lock() in braille_register_console()
    (new patch) [Sashiko]

  + Use "No functional changes." phrase in commit messages. [Steven]

  + Call try_enable_preferred_console() only when there is no
    preferred console (reworked and split 9th patch) [Petr]

  + Added taken Reviewed-by and Acked-by tags [John, Macros]


Changes against [v1]:

  + Fix stale comment (1st patch, Chris)

  + Add comment descibing update_preferred_console() behavior (3rd patch, John)

  + Better describe behavior changes caused by update_preferred_console()
    in the commit message (3rd patch, Chris)

  + Use unsigned int for iterating/indexing preferred_consoles[]
    table (3rd patch, John)

  + Add a check preventing an update via "devname" is already assigned
    to a real "name". (3rd patch, Petr)

  + Use only Braille entries when trying to enable Braille console (Chris)

  + Split all try_enable_*console() calls into new try_enable_console()
    and return early when try_enable_braille_console() succeeded.
    Note that we do not longer need to initialize "err" variable
    in this case. (new 5th patch, Chris, Petr)

  + Put back the explicit check of CON_BRL flag in register_console()
    so that it returns prelimitary only when the driver is used in Braille
    mode. (6th patch, Chris, Petr)

  + Add comments explaining that try_enable_braille_console() might succeeded
    also when newcon->match() succeeded. In this case, the Braille mode can't
    be used because the console device was already used as an early console.[*]
    (6th patch, Chris, Petr)

  + Reset preferred_dev_console_prev when used to revert the value.
    (7th patch, John)

  + Add Acked-by and Reviewed-by tags (1st, 2nd, 4th patch, Chris, Marcos)


[v1] https://lore.kernel.org/r/20260206165002.496724-1-pmladek@suse.com
[v2] https://lore.kernel.org/r/20260423130015.85175-1-pmladek@suse.com
[v3] https://lore.kernel.org/r/20260602085312.228251-1-pmladek@suse.com
[v4] https://lore.kernel.org/r/20260604101459.393162-1-pmladek@suse.com
[v5] https://lore.kernel.org/r/20260929120546.328616-1-pmladek@suse.com

Petr Mladek (16):
  printk: Rename struct console_cmdline to preferred_console
  printk: Rename preferred_console to preferred_dev_console
  printk: Cleanup _braille_(un)register_console() wrappers
  printk: Separate code for adding/updating preferred console metadata
  printk: Do not accept an empty name or devname as a preferred console
  printk: Prefer the console either via name or devname exclusively
  printk: Check that index is not defined when a console is preferred
    via devname
  printk: Ensure consistent name and devname when updating preferred
    console
  printk: Do not quietly ignore adding entry for a preferred console
    when there is no space
  printk: Allow to debug misuse of add_or_update_preferred_console()
  console/braille: Lock console->setup() call during the registration
  printk: Separate code for enabling console
  printk: Try to register each console as Braille first
  printk: Do not set Braille console as preferred_console
  printk: Modify try_enable_default_console() to return error/success
  printk: Try enable preferred consoles only when there are any

 .../accessibility/braille/braille_console.c   |  17 +-
 include/linux/console.h                       |   1 +
 kernel/printk/braille.c                       |  20 +-
 kernel/printk/braille.h                       |  22 +-
 .../{console_cmdline.h => console_register.h} |   9 +-
 kernel/printk/printk.c                        | 429 ++++++++++++------
 6 files changed, 338 insertions(+), 160 deletions(-)
 rename kernel/printk/{console_cmdline.h => console_register.h} (74%)

-- 
2.56.0


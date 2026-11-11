Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412111;
	b=z9Ay85m51spy3YMZ7UkLob5oacIK4DOe+43bYVHhMSWw7Z8vT8cfNiJMcwzUg0d26d9a
	 /S/XU4xIGGlvM8ymIE3R3o7Cc0v4ZxkIBSDIMIvlEROVFEASyUsT+cX2kCoql30GdfEaU
	 Ivt4FX79MGZU7ARThlxTENB1TPHVeJBfue70pQUe7acfmautZxu14qMnO1P5+jkvCOxcs
	 wX9BGRQLyRC+pUav9P6xAN0G5WQN/BXSNd4vdvJ+vepPdYoAmkFuSyPqmMnG+USiEF+pH
	 AdTEitCKX3mlzvTj2bIgJ3RTvmagEdIRClxiWg2TvgkrQ53X/q1GBuqVAhdyqW8nvww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fwO4/1BwKi23FwzRaiCllBY+OC6HKebGycCyUa+wjOY=;
	b=A1sOqouVft2BtRQalujwq+ayMza/drOAwVixU4FDDmbLSL+zVxAa3qlMmlj8vaBHfOcl
	 gSIjFCzsJep4k+ANS/zTO8qRGnT87nsIj2q/GcY0NuQEMX67qGVKhC06JWkNusfUZ4tcU
	 p8pP3ZEOuXI9uxJyU33eZ5XW86M6EOU7pqYiTkixRP86jrjFTZUTslQodejNwoSGXCV1b
	 KPihCyvaxRdgO4Hmsu33vvoKOHKFY+FDqaRJEJLYSdFfnXkjcw7CidRJIXDESUVHg38Xq
	 xIDCW7ivYY/ckOal6utWRL0i98IrEaUHCvEdHWZNm3gtjZ1Q7YkTdNnANiFxfc454og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Upht72vp;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF52D606A321
	for <printk@lists.linux.dev>; Wed, 11 Nov 2026 15:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF52D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Upht72vp
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so24708985e9.2
        for <printk@lists.linux.dev>; Wed, 11 Nov 2026 07:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412108; x=1795016908; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fwO4/1BwKi23FwzRaiCllBY+OC6HKebGycCyUa+wjOY=;
        b=Upht72vpeYLhKn4BFVgxuTNOrrCeyKCFhmPjnI0AttnSOUrvlEZSv0o5j8SbaeXsTy
         lDpzP0s/oR8P/1PrRsc6CjoTVjYFH7XhTPqOxy/QE75GGMiLjL7moZ9m3JpU/dTbVbQ6
         UhgKr3Kwz07UxNcAP2fDemxSrEbfNLbTdO/vzN7SYJ4OSMC2hos8c3UGYlfZu3UpKVrL
         k24iE1hEnXRYJEuH7O+73Wtus1fkSGKuymCI2t/klP/ivRS34+gIYT82Yb0NZEcacNkV
         7FKWvBiQGc3/p18dDkuDmAR+EetKUG+QRiWJmfZxQeJDAC9j235viDe7XifrEfDwxTgi
         Ae0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412108; x=1795016908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fwO4/1BwKi23FwzRaiCllBY+OC6HKebGycCyUa+wjOY=;
        b=PEsDRxSB7scrMw6/J8NzN3JEdO9PgKtWf/QV1TuVQ763O3laEUMAHpLCzDCxBGusdz
         OZza5Tw1Me7NhUueMWLkK2IE9A9mr30o9CILF2ebfGn5kcFPzxt0z2TQqudW85FiTOps
         LtQH64LBcj3mzXqHM/MdA9q+1pharp+rWw+y8DDP2pCNzeSiRWgFQKKFIG/STpxWc/qD
         QItekLmIdLkKH6rdE7D7oz385+jGEaqji6kaATyIv3rBJ4hFfoBHUbYtlAyXL/Am5HDq
         MwUZ/912nv1hJDCFi4POn+IKRApbd5ZsKKX3nV6RrQbwaK4QFjIQ9lV/xEwDIkulwCpR
         8DMw==
X-Forwarded-Encrypted: i=1; AL+hErHZl4uv5IlsTPyPB7wGAMDN0jatJLytkfDaqOiY4/TOHPbA6Bk6EuYKCUzItx30OhBZsenATBs=@lists.linux.dev
X-Gm-Message-State: APuU4Z/cWHPFGn+7sLxPXe9qNEI5pTWwvoB0Y2bipk0Itceh6caSjCtz
	VJT51h81r5VJRQb1Aro6iz+MnVkGA2hcZ6UzhYHnGK0Ak0J93MBhbY1b1MVVVe+9pdc=
X-Gm-Gg: AYBFou2mv9ZjziJnkFiKgs8UW8I667snloSSx93ICRoUwnrN+8R347z/wXvV4MQtHhH
	/Nm5OcH7G8I+C+dj3SZy6ONq402yywul5xXqonJUsvtZcLkKNmqjpm9WCvxiO9QgNbPjt0uw4Qc
	Y5gK1heWbyhj6vYJvaoyW6J5Ls2vFbfbVrNloJ66a3J8aECOnqMqNarNrB2eEXdLkSrz5XupZWC
	QoFE8FerG3mOutLwe4Ok0WbMkitgfabX+WYl1WT76yyTmiNLNflyaO/O513NewEaARooTdz4iL8
	F7en5wQFDu9noRjd2y201b0GMrGOZUynN9oHoFERr3LO3mkWgq+BM7xEC+hNzTmui+mPobenF08
	n4B+RKl+HA6YhmH5/SiJzPckpObvk+e212tAxuoFJBJb5lCkN3nSCECSP6/Z6fvqZkzk8c6keJp
	q9Ix/jNGk0/3ddv/YTzn5KZx+AzDogd3+n0woLymKw9bPk2UuupnHuqaPo1oQ8nPt7F1mPtdUq3
	84X/ZPu1JjQc6gRdXeyS8/N6uYRdG9lqXzzJhJ16tDSyzPXqSfH7VXxyBDlIkrgPBXirAIEuxsI
	AkD1Hv+XqvP1bgl7cWX7FxC9Rht6eYwReREsNwYcR/WfpCHUYKla
X-Received: by 2002:a05:600c:620e:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4ba091aacf9mr51825735e9.0.1794412108196;
        Wed, 11 Nov 2026 07:48:28 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c52fe1csm4787915e9.3.2026.11.11.07.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:48:27 -0800 (PST)
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
Subject: [PATCH v7 00/17] printk: Clean up preferred console handling
Date: Wed, 11 Nov 2026 16:47:59 +0100
Message-ID: <20261111154816.71103-1-pmladek@suse.com>
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


Changes against [v6]:

  + Hopefully fixed the formatt of the new function documentation
    (4th patch) [Chris, Sashiko]

  + Switch order for the handling of @name and @devname for new
    entries to follow the ordering of function parameters
    (4th patch) [Petr]

  + Add missing SOB (5th patch) [Petr]

  + Do not do the refactoring. Which just complicated the logic
    later. [Petr]

  + Make the check of @idx for @devname symmetric with the check
    for @name. Allow any negative value instead of hard-coded -1
    (7th patch) [Petr]

  + Keep the check of the new entries separate. It should prevent
    the problem with the cross-update. (8th patch) [Sashiko]

  + Update Braille options when the same console is preferred more
    times (new 14th patch) [Sashiko]


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
[v6] https://lore.kernel.org/r/20261106171952.207909-1-pmladek@suse.com


Petr Mladek (17):
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
  printk: Update Braille options when preferred more times
  printk: Do not set Braille console as preferred_console
  printk: Modify try_enable_default_console() to return error/success
  printk: Try enable preferred consoles only when there are any

 .../accessibility/braille/braille_console.c   |  17 +-
 include/linux/console.h                       |   1 +
 kernel/printk/braille.c                       |  20 +-
 kernel/printk/braille.h                       |  23 +-
 .../{console_cmdline.h => console_register.h} |   9 +-
 kernel/printk/printk.c                        | 438 ++++++++++++------
 6 files changed, 348 insertions(+), 160 deletions(-)
 rename kernel/printk/{console_cmdline.h => console_register.h} (74%)

-- 
2.56.0


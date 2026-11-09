Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242394;
	b=qrhCjOKgmi2AMRfCSrsH0VZtot+2lRvZ+AY1pTysRfb6P5FHU0QzmMc6OrgcRxn+h5wj
	 NiNftH8DYWfvXG541d43CYow0vzRQ+53w9UhS47GfJkleM+ZxppJ1vjlTEFg+vIH4bGFD
	 XYDGrCPMlFmXB6BMehchrSAjdAZsXkhioUul/JjGocUOJ6tAwsDEhP6tQCrxkFChheSG+
	 zD9yVW500/jn1sPwQenj8ENNRG9kBBqfdLsPXxWzjRzLToMuj3RUyYajt4Hby4PEhjSAl
	 rf9ArwxCYHfn7istf3d2hYpdnqqt6/uFvPav5/mzn9z/dvUNTd56II1ohna/IBQmDVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242394;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=WB+NnUFeCMCsVOxK+oV+Ndnf6qqRZy22YpXN6vlA5YI=;
	b=2mDTDJvVmLz4lFtOkxygPVD85Fc/KCIKe2LT60Ugo6THO4AoRIxycJNMY7GFyW9YzEs+
	 IyDhwFMeW1x3ImXGjoqX0ZeVLEW/yShNOLDvIDrWJx86DIBW5K0fmweWtvhnp28JlN8Hj
	 8dSdToZUaH00m7m4vQPauuDuTEDFmdryvolhr/dlC9RzESaScas+y84qwryksNcXHMC+m
	 ZpddXzmhgoCrvqyCxjogd1actxSdqq92e2b3Z8EC+BxlItps3rOfgoFelJqIG7/L58JXS
	 cLdLyRviUxyUvsCkm2f1MygxaOj6TOAStAIHnH96tMNbtRVYk5ousGHEeIkjYdHVzpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c5+bp0TX;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EF2606AAC6;
	Mon,  9 Nov 2026 16:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29EF2606AAC6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c5+bp0TX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794242393; x=1825778393;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qH7YxGJ9MhlbamqziXGD7CqNVxvvHmoJYm/8MPEQnoQ=;
  b=c5+bp0TX27FhS9VqBt8es5gs7A3bDKHIKAgN4Ix8/BFJU8Aeb7gZ+fYg
   TqnCc7MI2TEkdqAd8lQB2IYAadBUO1q8JBnCEZQ9zqt89q8Oq1W+D0SEw
   Y/vGpI2QVJ18vUAlkLM//RV+2+ssbi7tX67XEy6a4FnZiBeFpeMMpIy9q
   J6chRdPtF/LtLD3hJdNJBYT7gPj0gyRjbCyIl7LNkg0SmyX17t/NfOwGi
   ryKZj9Zb5o+KqYMalRZk7bzs4xSt6QC3uM4hqBgLKKgEpfFWcYh3Ikj9z
   0nMqTiUv3IL2Gj3RFEdfibRzOvikiRw424n4VETLMr51+8gx1Pc30ZiiE
   g==;
X-CSE-ConnectionGUID: DPre067WQ0aRl85BiO/e8g==
X-CSE-MsgGUID: PRDJ0bq0SAajJrLbnmcUxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3003916"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3003916"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 08:37:59 -0800
X-CSE-ConnectionGUID: GmDWVMvLTauuUilaK9NuLg==
X-CSE-MsgGUID: r/dUjpvoQKy3cqvMwTbmrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8073800"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Nov 2026 08:37:52 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQSNQ-00000000uud-40BN;
	Mon, 09 Nov 2026 16:37:48 +0000
Date: Tue, 10 Nov 2026 00:37:41 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>, Petr Mladek <pmladek@suse.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>, printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Bradley Morgan <include@grrlz.net>,
	"Christian Brauner (Amutable)" <brauner@kernel.org>,
	"Cen Zhang (Microsoft)" <blbllhy@gmail.com>,
	Petr Pavlu <petr.pavlu@suse.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH printk 1/6] printk: Introduce and specify flush reasons
Message-ID: <202611100015.e1CNRy54-lkp@intel.com>
References: <20261109123127.489676-2-john.ogness@linutronix.de>
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109123127.489676-2-john.ogness@linutronix.de>

Hi John,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d01f86a7da8161aac8c6304b377cf58fb75861ca]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Ogness/printk-Introduce-and-specify-flush-reasons/20261109-133718
base:   d01f86a7da8161aac8c6304b377cf58fb75861ca
patch link:    https://lore.kernel.org/r/20261109123127.489676-2-john.ogness%40linutronix.de
patch subject: [PATCH printk 1/6] printk: Introduce and specify flush reasons
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20261110/202611100015.e1CNRy54-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611100015.e1CNRy54-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611100015.e1CNRy54-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/printk/printk.c:4735 function parameter 'reason' not described in 'printk_trigger_flush'
>> Warning: kernel/printk/printk.c:4735 function parameter 'reason' not described in 'printk_trigger_flush'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
